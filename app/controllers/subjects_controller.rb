class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy ]

  def index
    if params[:limit]
      @subjects = Subject.starts_with(params[:limit]).order(:name)
    else
      @subjects = Subject.includes(:organisations).order(:name)
    end
  end

  def show
    @organisations = @subject.organisations
  end

  private
  def set_subject
    @subject = Subject.find(params[:id])
  end
end
