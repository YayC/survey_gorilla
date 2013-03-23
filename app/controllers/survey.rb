get '/survey/new' do
  erb :create_survey
end

post '/survey/new' do
  @survey = Survey.create(params.merge(:creator_id => current_user.id))
  set_created_survey(@survey)
  erb :create_survey
end

post '/question/new' do
  @question = current_created_survey.questions.create(:content => params[:content])
  params[:choices].split("\r").each do |c|
    @question.choices.create(:content => c.strip)
  end
  @survey = current_created_survey
  erb :create_survey
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

put 'survey/edit' do
  erb :create_survey
end


