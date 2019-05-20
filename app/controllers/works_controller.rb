# frozen_string_literal: true

class WorksController < ApplicationController
  def index
    @works = current_user.works
  end

  def new
    @work = Work.new
  end

  def show
    @work = find_work
  end

  def create
    # StrongParameters
    params.require(:work).permit(
      :title,
      :total_page,
      :selected_stage
    )

    @work = Work.new(title: params[:work][:title], total_page: params[:work][:total_page], user: current_user)
    @stage = Stage.find(params[:work][:selected_stage])

    # 原稿の手順・ページに対応した、進捗状態の作成
    @work.total_page.times do
      page = Page.create(work: @work)
      Progress.create(stage_id: @stage.id, page_id: page.id, work_id: @work.id)
    end

    if @work.save
      redirect_to work_stage_path(work_id: @work.id, id: @stage.id), notice: "#{@work.title}が登録されました"
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
        :title,
        :total_page
      )
    end

    def find_work
      current_user.works.find(params[:id])
    end
end
