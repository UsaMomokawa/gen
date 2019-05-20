class Works::StagesController < ApplicationController
  def show
    @work = Work.find(params[:work_id])
    @stage = Stage.find(params[:id])
    @progresses = @work.progresses.where(stage: @stage)
  end
end
