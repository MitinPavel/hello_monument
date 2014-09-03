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

  def edit
    @monument = @collection.monuments.find params[:id]
  end

  def update
    @monument = @collection.monuments.find params[:id]

    if @monument.update monument_params
      flash[:notice] = "Monument was successfully updated."
      redirect_to edit_collection_monument_path(@collection, @monument)
    else
      render :edit
    end
  end

  def destroy
    @monument = @collection.monuments.find params[:id]

    @monument.destroy

    flash[:notice] = "Monument was successfully deleted."
    redirect_to collections_path
  end

  private

  def load_collection
    @collection = current_user.collections.find params[:collection_id]
  end

  def monument_params
    params.require(:monument).permit :name, :description, :category_list
  end
end
