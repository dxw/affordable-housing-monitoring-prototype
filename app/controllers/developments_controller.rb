class DevelopmentsController < ApplicationController
  def index
    @developments = Development.all.order('signed_on DESC')
  end

  def new
    @development = Development.new
  end

  def create
    @development = Development.new(development_params)
    if @development.save
      redirect_to development_dwellings_path(@development)
    else
      render action: :new
    end
  end

  def edit
    @development = Development.find(params[:id])
  end

  def update
    @development = Development.find(params[:id])
    if @development.update(development_params)
      redirect_to development_dwellings_path(@development)
    else
      render action: :edit
    end
  end

  def destroy
    @development = Development.find(params[:id])
    @development.destroy
    redirect_to developments_path
  end

  def completion_form
    @development = Development.find(params[:id])
  end

  def completion
    @development = Development.find(params[:id])
    @development.update_attributes(
      params.require(:development).permit(
        dwellings_attributes: %i[id address uprn registered_provider]
      )
    )
  end

  private

  def development_params
    params.require(:development).permit(
      :application_number,
      :site_address,
      :proposal,
      :status
    )
  end
end
