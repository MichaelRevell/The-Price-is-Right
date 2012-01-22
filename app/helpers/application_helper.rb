module ApplicationHelper
  def score
    session[:score] = 0 if session[:score].nil?
    session[:score] = 0 if params[:score].nil? == false
    return session[:score]
  end 
  
end
