module ApplicationHelper
  def score
    session[:score] = 0 if session[:score].nil?
    return session[:score]
  end 
  
end
