class PicturesController < ApplicationController
  before_filter :load_monument

  def index
    @picture_info = @monument.picture_infos.build
    @picture_infos = @monument.picture_infos.all
  end

  def create
    @picture_info = store_file_and_build_picture

    if @picture_info.save
      flash[:notice] = "Picture was successfully uploaded."
      redirect_to monument_pictures_path(@monument)
    else
      @picture_infos = @monument.picture_infos.all
      render :index
    end
  end

  def show
    @picture_info = @monument.picture_infos.find params[:id]
  end

  private

  def load_monument
    @monument = current_user.monuments.find params[:monument_id]
  end

  def picture_params
    params.require(:picture_info).permit :name, :description
  end

  def store_file_and_build_picture
    picture_info = @monument.picture_infos.build picture_params

    if (file = params[:picture_info][:file])
      data_id = ::Storage::Facade.instance.store_file file
      picture_info.data_id = data_id
      picture_info.uploaded_at = Time.now.utc
    end

    picture_info
  end

  def store_file(picture_info)
    ::Storage::Facade.instance.store_file params[:picture_info][:file]
  end
end
