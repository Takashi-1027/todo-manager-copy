class BooksController < ApplicationController
  def search
    if params[:keyword] == ""
      redirect_to books_search_path, notice: "タイトルを入力してください"
    elsif params[:keyword].nil?
    else
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end
end