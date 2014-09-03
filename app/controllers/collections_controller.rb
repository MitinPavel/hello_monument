class CollectionsController < ApplicationController
  def new
    @collection = current_user.collections.build
  end

  def create
    @collection = current_user.collections.build collection_params

    if @collection.save
      flash[:notice] = "Collection was successfully created."
      redirect_to new_collection_path
    else
      render :new
    end
  end

  def index
    @collections = current_user.collections.all
  end

  private

  def collection_params
    params.require(:collection).permit :name
  end
end
