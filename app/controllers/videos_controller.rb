class VideosController < ApplicationController
  def index
    
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:success] = 'Video added!'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def new
    @video = Video.new
  end

  private
  def video_params
    params.require(:video).permit(:link)
  end

end