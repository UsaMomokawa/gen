class Api::Works::PagesController < ApplicationController
  def index
    @pages = Page.where(
      work_id: Work.find(params[:work_id])
    )
  end
end
