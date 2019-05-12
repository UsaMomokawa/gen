class StagesController < ApplicationController
  def index
    @stages = current_user.stages.all
  end

  def new
    @stage = Stage.new
  end

  def create
    @stage = Stage.new(stage_params)
    @stage.user = current_user

    if @stage.save
      redirect_to stages_path, notice: "#{@stage.name}が登録されました"
    else
      render "new"
    end
  end

  def edit
    @stage = find_stage
  end

  def update
    @stage = find_stage
    if @stage.update(stage_params)
      redirect_to stages_path, notice: "#{@stage.name}を変更しました"
    else
      render "edit"
    end
  end

  def destroy
    stage = find_stage
    stage.destroy
    redirect_to stages_path, notice: "#{stage.name}を削除しました"
  end

  private
    def stage_params
      params.require(:stage).permit(
        :name
      )
    end

    def find_stage
      current_user.stages.find(params[:id])
    end
end
