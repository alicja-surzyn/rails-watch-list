class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
      # doesn't need view page
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(list_params)
    if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  # end

  private

  def list_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
