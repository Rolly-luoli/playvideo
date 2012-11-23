class VideosController < ApplicationController
     http_basic_authenticate_with :name => "dhh", :password => "secret"
     def index
        #@videos =Video.all
          @videos = Video.paginate(:page => params[:page], :per_page => 5).order('id DESC')

          respond_to do |format|
               format.html #index.html.erb
               format.json  { render :json =>@videos}
          end    
     end
     def show 
           @video = Video.find( params[:id] )    

          respond_to do |format|
                format.html #show.html.erb
                format.json  { render :json =>@video} 
           end      
     end

end
