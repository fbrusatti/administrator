class Administrator::Admin < ApplicationController  

  layout 'administrator/admin'

  def new  
    @admin = Administrator.new  
  end  
    
  def create  
    @admin = Administrator.new(params[:administrator])  
    if @admin.save  
      redirect_to root_url, :notice => "Signed up!"  
    else  
      render "new"  
    end  
  end  
end
