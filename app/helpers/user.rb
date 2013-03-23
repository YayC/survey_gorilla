helpers do

# user helpers

  def current_user
    if session[:token] && User.find(session[:token])
      @current_user ||= User.find(session[:token])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def login(user)
    session[:token] = user.id
    current_user
  end

#survey helpers   

  def current_created_survey
      if session[:created_survey] && Survey.find(session[:created_survey])
        @current_created_survey ||= Survey.find(session[:created_survey])
      end  
  end


  def set_created_survey(survey)
    session[:created_survey] = survey.id
    current_created_survey
  end

   def clear_created_survey
    session[:created_survey] = nil
  end


end


