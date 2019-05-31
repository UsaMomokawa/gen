# frozen_string_literal: true

class PagesController < ApplicationController
  def create
    work = Work.find(params[:work_id])
    page = Page.new(
      work: work
    )
    page.save!
    work.stages.each do |stage|
      Progress.create(work: work, stage: stage, page: page)
    end
    redirect_to work,
      notice: "ページを追加しました"
  end
end
