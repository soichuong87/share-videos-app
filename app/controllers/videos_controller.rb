class VideosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @videos = Video.all.order(id: :desc)
  end

  def create
    @video = current_user.videos.new(video_params)
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