class ApplicationController < ActionController::Base
  protect_from_forgery
  # respond_to :html, :xml, :js
  
  
  def search
    @user = User.where("username LIKE ?" , "%#{params[:search_text]}%").first rescue nil
    if @user
      redirect_to :controller => "tweets", :action => "index", :user => @user.id
    else  
      redirect_to :controller => "tweets", :action => "index"
    end  
  end

end
