class Api::PagesController < ApplicationController
  def show
    @page = Page.find_by(
      id: params[:id]
    )
  end

  def update
    page = Page.find_by(
      id: params[:id]
    )

    if page.update(matter: params[:matter])
      render json: page, status: :ok
    else
      render json: page.errors, status: :unprocessable_entity
    end
  end
end
