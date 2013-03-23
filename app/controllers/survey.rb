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


put 'survey/edit' do
  erb :survey
end




