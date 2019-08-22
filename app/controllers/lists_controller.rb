class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new(params[:list])
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    @list.save
    redirect_to dashboard_path
  end

  def edit
    @list = List.find(params[:id])
    redirect_to dashboard_path
  end

  def update
    @list = List.find(params[:id])
    @list.update(params[:list])
    redirect_to dashboard_path
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to dashboard_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
