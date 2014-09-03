class DashboardsController < ApplicationController
  def show
    @monuments = if params[:query]
                   ids = ::Search::Facade.instance.find params[:query]
                   current_user.monuments.where(id: ids).all
                 else
                   []
                 end
  end
end
