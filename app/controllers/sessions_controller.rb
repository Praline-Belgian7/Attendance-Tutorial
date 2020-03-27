class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログイン後にユーザー情報ページにリダイレクトします。
      log_in(user)
      redirect_to(user)
    else
      flash.now[:danger] = "承認に失敗しました。"
      render :new
    end
  end
  
end
