class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: { message: "estou autenticado acessando members!!!" }
  end
end