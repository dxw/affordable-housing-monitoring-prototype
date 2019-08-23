class DwellingsController < ApplicationController
  before_action :find_development

  def index
    @dwellings = @development.dwellings
    @dwelling = Dwelling.new
  end

  def create
    @dwelling = Dwelling.new(dwelling_params.merge(development: @development))
    if @dwelling.save
      AuditLog.create!(
        created_by: 'Alicia Smith',
        development: @development,
        dwelling: @dwelling,
        comment: params[:comment],
        what_changed: 'New dwelling was added'
      ) if @development.status != 'new'
      redirect_to development_dwellings_path(@development)
    else
      @dwellings = @development.dwellings
      render action: :index
    end
  end

  def edit
    @dwelling = @development.dwellings.find(params[:id])
  end

  def update
    @dwelling = @development.dwellings.find(params[:id])
    if @dwelling.update(dwelling_params)
      AuditLog.create!(
        created_by: 'Alicia Smith',
        development: @development,
        dwelling: @dwelling,
        comment: params[:comment],
        what_changed: "Dwelling #{dwelling_changes}"
      ) if @development.status != 'new'
      redirect_to development_dwellings_path(@development)
    else
      render action: :edit
    end
  end

  def destroy
    @dwelling = @development.dwellings.find(params[:id])
    @dwelling.destroy
    redirect_to development_dwellings_path(@development)
  end

  private

  def find_development
    @development = Development.find(params[:development_id])
  end

  def dwelling_params
    params.require(:dwelling).permit(:tenure, :habitable_rooms, :bedrooms, :address, :uprn, :registered_provider)
  end

  def dwelling_changes
    @dwelling.previous_changes.except(:updated_at).collect {|key,change| "#{key.humanize(capitalize: false)} changed from #{change[0]} to #{change[1]}"}.to_sentence
  end
end
