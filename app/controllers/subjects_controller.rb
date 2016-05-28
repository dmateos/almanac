class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy ]

  def index
    @subjects = Subject.includes(:organisations).order(:name)
  end

  def show
    @organisations = @subject.organisations
  end

  private
  def set_subject
    @subject = Subject.find(params[:id])
  end
end
