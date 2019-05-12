# frozen_string_literal: true

class WorksController < ApplicationController
  def index
    @works = current_user.works
  end

  def show
    @work = find_work
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.user = current_user

    if @work.save
      redirect_to work_path(@work), notice: "#{@work.title}が登録されました"
    else
      render "new"
    end
  end

  def edit
    @work = find_work
  end

  def update
    @work = find_work

    if @work.update(work_params)
      redirect_to work_path(@work), notice: "#{@work.title}の情報が変更されました"
    else
      render "edit"
    end
  end

  def destroy
    work = find_work
    work.destroy
    redirect_to works_path, notice: "#{work.title}を削除しました"
  end

  private
    def work_params
      params.require(:work).permit(
        :title
      )
    end

    def find_work
      current_user.works.find(params[:id])
    end
end
