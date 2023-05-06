class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to @list
    else
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
