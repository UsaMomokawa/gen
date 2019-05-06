# frozen_string_literal: true

class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    work = Work.new(work_params)
    work.user_id = 1
    # work.user = current_user

    if work.save
      redirect_to work_path(work), notice: "#{work.title}が登録されました"
    else
      render "new"
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    if work.update(work_params)
      redirect_to work_path(work), notice: "#{work.title}の情報が変更されました"
    else
      render "edit"
    end
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to works_path, notice: "#{work.title}を削除しました"
  end

  private
    def work_params
      params.require(:work).permit(
        :title
      )
    end
end
