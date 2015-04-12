class Admin::VideosController < AdminsController
  
  def new
    @video = Video.new
  end

  def create
    @video = Video.create(video_params)

    if @video.save
      flash[:success] = "'#{@video.title}' was successfully added."
      redirect_to new_admin_video_path
    else
      flash[:danger] = "Video couldn't be saved. Please try again."
      render :new
    end
  end

  private

    def video_params
      params.require(:video).permit(:title, :description, :category_id, :large_cover, :small_cover, :video_url)
    end
end