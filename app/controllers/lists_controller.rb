class ListsController < ApplicationController
before_action :set_list, only: [:show]
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
    redirect_to @list, notice: "List was successfully created!"
    else
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def lists_params
    params.require(:list).permit(:name)
  end
end
