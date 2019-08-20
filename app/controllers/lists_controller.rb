class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new(params[:list])
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to
  end

  def edit
    @list = List.find(params[:id])
    redirect_to
  end

  def update
    @list = List.find(params[:id])
    @list.update(params[:list])
    redirect_to
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
