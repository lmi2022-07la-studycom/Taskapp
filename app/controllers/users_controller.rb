class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show, :edit, :update]
  before_action :already_logged_in, only: [:new, :create]
  def show
    @user = current_user
    @tasks = current_user.tasks.all.page(params[:page]).per(20).order(:created_at)
    case params[:sort]
    when "todo"
      @tasks = @tasks.where(status: '未着手')
    when "doing"
      @tasks = @tasks.where(status: '実施中')
    when "done"
      @tasks = @tasks.where(status: '完了')
    else
    end
    @task = Task.new

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = '登録しました'
      redirect_to root_path
    else
      flash.now[:danger] = '登録できませんでした'
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :user_name, :birthday, :email, :password, :password_confirmation
    )
  end
end
