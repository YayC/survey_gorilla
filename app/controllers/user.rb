
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
  @user = User.find_by_email(params[:email])
  if @user.nil?
    @errors = "YOU ARE NOT IN THE DATABASE AT ALL."
    erb :index
  elsif @user.password == params[:password]
    login(@user)
    redirect '/profile'
  else
    @errors = "HOW ABOUT A REAL PASSWORD"
    erb :index
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
