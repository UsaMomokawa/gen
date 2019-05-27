class Api::Works::Stages::ProgressesController < ApplicationController
  def show
    @progress = Progress.find_by(
      work_id: params[:work_id],
      stage_id: params[:stage_id],
      page_id: params[:page_id]
    )
  end

  def update
    progress = Progress.find_by(
      work_id: params[:work_id],
      stage_id: params[:stage_id],
      page_id: params[:page_id]
    )

    if progress.update(status: params[:status])
      render json: progress, status: :ok
    else
      render json: progress.errors, status: :unprocessable_entity
    end
  end
end
