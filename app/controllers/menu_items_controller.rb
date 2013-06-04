class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
  end

  def show
    @menu_item = MenuItem.find(params[:id])
    @comment = @menu_item.comments.build
  end

  def new
    @menu_item = MenuItem.new
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def create
    @menu_item = MenuItem.new(params[:menu_item])

    if @menu_item.save
      redirect_to menu_items_path, notice: 'Menu item was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @menu_item = MenuItem.find(params[:id])

    if @menu_item.update_attributes(params[:menu_item])
      redirect_to menu_items_path, notice: 'Menu item was successfully updated!! Hooray'
    else
      render action: "edit"
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    redirect_to menu_items_path, notice: 'Menu item was successfully destroyed'
  end
end
