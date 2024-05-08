class CommentsController < ApplicationController
  before_action :set_book
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @book.comments.build(comment_params)
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
    render :edit
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
      redirect_to @book
    end
  end

  def like
    @comment = Comment.find(params[:id])
    @comment.likes.create(user_id: current_user.id)
    flash[:success] = 'Comentário curtido com sucesso'
    redirect_to @comment.book
  end

  def dislike
    @comment = Comment.find(params[:id])
    @comment.likes.where(user_id: current_user.id).destroy_all
    flash[:alert] = 'Não curtiu o comentário'
    redirect_to @comment.book
  end

  private

  def set_book
    @book = Book.find_by(id: params[:book_id])
    redirect_to root_path, alert: 'Livro não encontrado' unless @book
  end
  

  def set_comment
    @comment = @book.comments.find_by(id: params[:id])
    unless @comment
      flash[:alert] = 'Comentário não encontrado'
      redirect_to book_path(@book) # or render an error page
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
