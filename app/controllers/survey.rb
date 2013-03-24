
# survey creator routes

post '/survey/upload' do
  @survey = current_created_survey
  picture = @survey.pictures.new  
  picture.image.store!(params[:file])
  picture.save
  puts "complete"
  erb :create_survey
end

post '/survey/new' do
  @survey = Survey.create(params.merge(:creator_id => current_user.id))
  set_created_survey(@survey)
  redirect "/survey/edit/#{@survey.id}"
end

get '/survey/edit/:id' do
  @survey = Survey.find(params[:id])
  erb :create_survey
end

post '/question/new' do
  @question = current_created_survey.questions.create(:content => params[:content])
  params[:choices].split("\r").each do |c|
    @question.choices.create(:content => c.strip) unless c == ''
  end
  @survey = current_created_survey
  erb :_create_survey_question, :layout => false
end

get '/survey/delete/:id' do
  if current_user.id == Survey.find(params[:id]).creator_id
    Survey.delete(params[:id])
  end    
  redirect '/profile'
end

# survey taker routes


get '/survey/:survey_id' do
  
  @survey = Survey.find(params[:survey_id])
  if current_user.surveys.map{|s| s.id }.include?(params[:survey_id].to_i)
    redirect "/"
  end

  erb :rendered_survey
end

post '/survey/:survey_id' do
  if current_user.surveys.map{|s| s.id }.include?(params[:survey_id].to_i)
    redirect "/"
  end

  # @params = params #to debug params
  params[:questions].each_value do |choice_id|
    Answer.create( :choice_id => choice_id, :user_id => current_user.id  )
  end

  cs = CompletedSurvey.new( :user_id => current_user.id, 
                          :survey_id => params[:survey_id] )

  if cs.valid?
    cs.save
    redirect "/survey/#{params[:survey_id]}/results"
  else
    #TODO: prevent submission unless all questions completed
    redirect "/survey/#{params[:survey_id]}"
  end
end

get '/survey/:survey_id/results' do
  @survey = Survey.find(params[:survey_id])
  @overall_respondents = @survey.num_respondents

  @q_response_rates =[]
  @question_strings= []
  @c_response_rates = [] #a nested array, each index of the inner array is a choice's num_respondents
  @choice_strings = [] #nested array, each index of the inner array is a choice's content

  @survey.questions.each_with_index do |question, i|
    @q_response_rates << question.num_respondents
    @question_strings << question.content

    @c_response_rates[i] = []
    @choice_strings[i] = []

    question.choices.each do |choice|
      @c_response_rates[i] << choice.num_respondents
      @choice_strings[i] << choice.content
    end
  end
  
  erb :survey_results
end










