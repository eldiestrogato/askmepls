class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id

      redirect_to root_path, notice: 'Добро пожаловать на борт! Снова.'

    else
      flash.now[:alert] = 'Что-то не сходится..'

      render :new
    end

    def destroy
      session.delete(:user_id)

      redirect_to root_path, notice: 'Вы стали незнакомцем на нашем корабле.'
    end

  end
end
