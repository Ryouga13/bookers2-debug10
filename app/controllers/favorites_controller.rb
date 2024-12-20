class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.book_id = @book.id
    favorite.save
    # app/views/favorites/create.js.erbを参照する
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
    favorite.destroy
    # app/views/favorites/destroy.js.erbを参照する
  end


end
