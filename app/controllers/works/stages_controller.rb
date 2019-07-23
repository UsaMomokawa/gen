# frozen_string_literal: true

class Works::StagesController < ApplicationController
  before_action :set_work, only: %i(index show new edit)

  def index
    @stages = @work.stages.order(:created_at)
  end

  def show
    @stage = Stage.find(params[:id])
    @progresses = @work.progresses.where(stage: @stage).order(:page_id)
  end

  def new
    @stage = Stage.new
  end

  def create
    work = Work.find(params[:work_id])
    @stage = Stage.new(stage_params)
    @stage.work = work

    if @stage.save
      work.pages.each do |page|
        Progress.create(work: work, stage: @stage, page: page)
      end
      redirect_to work_stages_path(work), notice: "#{@stage.name}が登録されました"
    else
      flash.now[:alert] = "入力項目に誤りがあります"
      render "new"
    end
  end

  def edit
    @stage = Stage.find(params[:id])
  end

  def update
    @stage = Stage.find(params[:id])

    if @stage.update(stage_params)
      redirect_to work_stages_path(@stage.work), notice: "工程を更新しました"
    else
      flash.now[:alert] = "入力項目に誤りがあります"
      render "edit"
    end
  end

  def destroy
    stage = Stage.find(params[:id])
    stage.destroy
    redirect_to work_stages_path(stage.work), notice: "工程を削除しました"
  end

  private
    def stage_params
      params.require(:stage).permit(
        :name
      )
    end

    def set_work
      @work = Work.find(params[:work_id])
    end
end
