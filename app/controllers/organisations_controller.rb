class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found  

  def index
    @organisations = Organisation.all
  end

  def show
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    3.times { @organisation.contacts << Contact.new }

    if @organisation.save
      flash[:notice] = "Organisation created, now you can edit additional options"
      redirect_to edit_organisation_path(@organisation)
    else
      flash[:error] = "Invalid options"
      render :new
    end
  end

  def edit
  end

  def update
    @organisation.update!(organisation_params)
    redirect_to @organisation
  end

  def destroy
  end

  private

  def record_not_found
    flash[:error] = "Organisation not found"
    redirect_to organisations_path
  end

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(
      :name, :aka, :acronym, :former_name, 
      :accreditation, :logo,
      :street_address, :street_suburb, :street_state, :street_postcode,
      :post_address, :post_suburb, :post_state, :post_postcode
    )
  end
end
