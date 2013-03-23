get '/survey/new' do
  erb :survey
end

post '/survey/new' do
  @survey = current_user.create(params[:survey])
  erb :survey
end

post '/question/new' do
  @question = @survey.question.create(params[:question])
  params[:choices].split('\n').each do |c|
  @question.choices.create(c)
  erb :survey
  end
end


put '/survey/edit' do
  erb :survey
end

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

  @survey = Survey.find(params[:survey_id])
  # @params = params to debug params
  CompletedSurvey.create( :user_id => current_user.id, 
                          :survey_id => params[:survey_id] )
  params[:questions].each_value do |choice_id|
    Answer.create( :choice_id => choice_id, :user_id => current_user.id  )
  end

  erb :survey_results
end


