class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user

  end

  def update
    @user = current_user
    if @user.update(update_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = current_user
    authorize @user
    @user.destroy
    redirect_to root_path
  end

  private

  def update_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :bio)
  end

end
