class WorksController < ApplicationController
  before_action :set_pages

  def index
    @works = Work.all
  end

  def show
    @work = find_work
  end

  def new
  end

  def edit
  end

  private  
    def set_pages
      @pages = find_work.pages.order(created_at: :desc)
    end

    def find_work
      Work.find(params[:id])
    end
end
