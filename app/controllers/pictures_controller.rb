class PicturesController < ApplicationController

  before_filter :load_monument

  def index
    @picture_info = @monument.picture_infos.build
    @picture_infos = @monument.picture_infos.all
  end

  def create
    @picture_info = @monument.picture_infos.build picture_params

    @picture_info.data_id = "#{rand(9999999)}-fake-id"
    @picture_info.uploaded_at = Time.now.utc

    if @picture_info.save
      flash[:notice] = "Picture was successfully uploaded."
      redirect_to monument_pictures_path(@monument)
    else
      @picture_infos = @monument.picture_infos.all
      render :index
    end
  end

  private

  def load_monument
    @monument = current_user.monuments.find params[:monument_id]
  end

  def picture_params
    params.require(:picture_info).permit :name, :description
  end
end
