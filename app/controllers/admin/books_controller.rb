module Admin
  class BooksController < BaseController
    before_action :set_book, only: [:edit, :update, :destroy, :show]

    def index
      @q = Book.ransack(params[:q])
      @books = @q.result(distinct: true).order(:title)
      @pagy, @books = pagy(@books)
    end

    def show
      render :form
    end

    def new
      @book = Book.new
      render :form
    end

    def create
      @book = current_user.books.new(book_params)
      if @book.save
        flash[:success] = "Empresa criada com sucesso!"
        redirect_to action: :index
      else
        render :form, status: :unprocessable_entity
      end
    end

    def edit
      render :form
    end

    def update
      if @book.update(books_params)
        flash[:notice] = "Empresa atualizada com sucesso!"
        redirect_to action: :index
      else
        render :form, status: :unprocessable_entity
      end
    end

    def destroy
      @book.destroy
      redirect_to action: :index
    end

    private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(
        :title, 
        :author, 
        :description, 
        :rating, 
        :price, 
        :image
      )
    end
  end
end