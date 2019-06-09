# frozen_string_literal: true

class Works::StagesController < ApplicationController
  def show
    @work  = find_work
    @stage = Stage.find(params[:id])
    @progresses = @work.progresses.where(stage: @stage).order(:page_id)
  end

  def new
    @stage = Stage.new
  end

  def create
    @stage = Stage.new(stage_params)
    @work  = find_work
    @stage.work_id = @work.id

    if @stage.save
      @work.pages.each do |page|
        Progress.create(work: @work, stage: @stage, page: page)
      end
      redirect_to work_stage_path(work_id: @work, id: @stage), notice: "#{@stage.name}が登録されました"
    else
      render "new"
    end
  end

  private
    def stage_params
      params.require(:stage).permit(
        :name
      )
    end

    def find_work
      Work.find(params[:work_id])
    end
end
