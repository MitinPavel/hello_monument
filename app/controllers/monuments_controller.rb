class MonumentsController < ApplicationController
  before_filter :load_collection

  def new
    @monument = @collection.monuments.build
  end

  def create
    @monument = @collection.monuments.build monument_params

    if @monument.save
      flash[:notice] = "Monument was successfully created."
      redirect_to new_collection_monument_path(@collection)
    else
      render :new
    end
  end

  private

  def load_collection
    @collection = current_user.collections.find params[:collection_id]
  end

  def monument_params
    params.require(:monument).permit :name, :description
  end
end
