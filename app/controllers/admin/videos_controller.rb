class Admin::VideosController < ApplicationController
    http_basic_authenticate_with :name => "dhh", :password => "secret"
     def index
        #@videos =Video.all
          @videos = Video.paginate(:page => params[:page], :per_page => 5).order('id DESC')

          respond_to do |format|
               format.html #index.html.erb
               format.json  { render :json =>@videos}
          end    
     end

     def  new 
          @video =Video.new 

          respond_to do |format|
                  format.html #new.html.erb
                  format.json   {render :json =>@video} 
          end
      end 

     def create
           @video =Video.new(params[:video])

          respond_to do |format|
                    if @video.save 
                          format.html { redirect_to(@video,
                                                           :notice => "Video Was  sucessfully uploaded"  ) }
                          format.json  { render  :json =>@video,
                                                             :status => :created,   :location =>@video}
                      else 
                          format.html  {render :action =>'new' }
                           format.json  {render :json =>@video.errors,
                                                            :status => :unprocessable_entity } 
                      end                                      
          end
     end 

     def show 
           @video = Video.find( params[:id] )    

          respond_to do |format|
                format.html #show.html.erb
                format.json  { render :json =>@video} 
           end      
     end
     def edit 
          @video = Video.find(params[:id])

     end
     def update
          @video = Video.find(params[:id])
 
          respond_to do |format|
          if @video.update_attributes(params[:video])
               format.html  { redirect_to( @video,
                                               :notice => 'video was successfully updated.') }
               format.json  { head  :no_content }
          else
               format.html  { render :action => "edit" }
               format.json  { render :json => @video.errors,
                                                :status => :unprocessable_entity }
          end
          end
     end

     
     def destroy
           @video = Video.find(params[:id])
           @video .destroy
           
           respond_to do |format|
                format.html { redirect_to admin_videos_url }
                format.json { head  :no_content}
           end     
     end
end
