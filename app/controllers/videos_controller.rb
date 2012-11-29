class VideosController < ApplicationController
     
     def index
        #@videos =Video.all
          @videos = Video.paginate(:page => params[:page], :per_page => 5).order('id DESC')       
     end

     def show 
           @video = Video.find( params[:id] )        
     end
end
