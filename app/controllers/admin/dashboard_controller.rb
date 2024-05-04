module Admin
  class DashboardController < BaseController
    def index
      @books_count = Book.count
      @comments_count = Comment.count
      @users = User.all
    end    
  end
end