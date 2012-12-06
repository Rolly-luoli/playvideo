class Admin::VideosController < Admin::ApplicationController

    def index
        #@videos =Video.all
      check_login()
      @videos = Video.paginate(:page => params[:page], :per_page => 5).order('id DESC')
    end

    def  new 
      check_login()
      @video =Video.new 
    end 

    def create
      check_login()
      @video =Video.new(params[:video])

      respond_to do |format|
           if @video.save 
           format.html { redirect_to(admin_videos_path,
                                    :notice => "Video Was  sucessfully uploaded"  ) }
           else 
           format.html  {render :action =>'new' }
          end                                      
          end
    end 

    def show 
      check_login()
      @video = Video.find( params[:id] )    
    end
    def edit 
      check_login()
      @video = Video.find(params[:id])

    end
    def update
     check_login()
     @video = Video.find(params[:id])
 
     respond_to do |format|
         if @video.update_attributes(params[:video])
         format.html  { redirect_to( admin_videos_path,
                                   :notice => 'video was successfully updated.') }
         else
         format.html  { render :action => "edit" }
         end
     end
    end

     
    def destroy
      check_login()
      @video = Video.find(params[:id])
      @video .destroy
           
      respond_to do |format|
          format.html { redirect_to admin_videos_url }
      end     
    end
     private 
    def check_login
        if session[:user_id] == nil
             redirect_to new_session_path
        end
    end
end