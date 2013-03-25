
get '/' do
  erb :index
end

post '/users/new' do
  @user = User.new(params[:signup])
  if @user.save
    login(@user)
    redirect '/profile'
  else
    erb :index
  end
end

post '/sessions/new' do
  # content_type :text
  @user = User.find_by_email(params[:email])
  if @user.nil?
    status 400 #invalid submission
    "EMAIL NOT IN THE DATABASE."
  elsif @user.password == params[:password]
    status 200
    login(@user)
    '/profile'
  else
    status 400 #invalid submission
    "HOW ABOUT A REAL PASSWORD?"
  end
end

get '/profile' do
  if logged_in?
    @user = current_user
    erb :profile
  else
    @errors = "You have to be logged-in to view that page"
    erb:index
  end
end


get '/user/logout' do
  session.clear
  redirect '/'
end
