module Administrator
  # note that ApplicationController here is in fact Blog::ApplicationController
  class AdminsController < Administrator::ApplicationController
    layout 'administrator/admin'

    def index
      @admins = Admin.all
    end

    def new
      @admin = Admin.new  
    end  
      
    def create  
      @admin = Admin.new(params[:admin])
      if @admin.save  
        redirect_to admin_url, :notice => "Signed up!!!"  
      else  
        render "new"  
      end  
    end  
  end

end
