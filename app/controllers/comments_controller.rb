class CommentsController < ApplicationController
  def create
    @menu_item = MenuItem.find(params[:menu_item_id])
    @comment = @menu_item.comments.build(params[:comment])

    if @comment.save
      flash[:notice] = "You have been HEARD, user."
      redirect_to menu_item_path(@menu_item)
    else
      flash[:error] = "Nobody can HEAR you..."
      render 'new'
    end
  end
end
