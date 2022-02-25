class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit]

  def index
    @title = 'Lists'
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(lists_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created!'
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def lists_params
    params.require(:list).permit(:name, :photo)
  end
end
