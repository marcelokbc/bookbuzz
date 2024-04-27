class CommentsController < ApplicationController
  before_action :set_book
  before_action :set_comment, only: %i[show edit update destroy]

  def create
    @comment = @book.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = 'Comentário criado com sucesso'
      redirect_to @book
    else
      flash[:error] = 'Comentário não pode ser criado'
      redirect_to @book
    end
  end

  def edit
    render :form
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = 'Comentário atualizado com sucesso'
      redirect_to @book
    else
      flash[:error] = 'Comentário não pode ser atualizado'
      render :form
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = 'Comentário deletado com sucesso'
      redirect_to @book
    else
      flash[:error] = 'Comentário não pode ser deletado'
      render :form, status: :unprocessable_entity
    end
  end

  def like
  end

  def dislike
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_comment
    @comment = @book.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
