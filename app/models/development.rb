class Development < ApplicationRecord
  has_many :dwellings, dependent: :destroy
  has_many :audit_logs
  STATUSES = %w[new agreed completed].freeze

  accepts_nested_attributes_for :dwellings, update_only: true

  default_scope { order(created_at: :asc) }

  def total_dwellings
    dwellings.count
  end

  def total_habitable_rooms
    dwellings.sum(:habitable_rooms)
  end

  def total_bedrooms
    dwellings.sum(:bedrooms)
  end

  def total_affordable_dwellings
    dwellings.affordable.count
  end

  def total_affordable_habitable_rooms
    dwellings.affordable.sum(:habitable_rooms)
  end

  def total_affordable_bedrooms
    dwellings.affordable.sum(:bedrooms)
  end

  def percentage_affordable_dwellings
    calculate_percentage(total_affordable_dwellings, total_dwellings)
  end

  def percentage_affordable_habitable_rooms
    calculate_percentage(total_affordable_habitable_rooms, total_habitable_rooms)
  end

  def percentage_affordable_bedrooms
    calculate_percentage(total_affordable_bedrooms, total_bedrooms)
  end

  def developer_needs_to_respond?
    status == 'completed' && dwellings.where("(coalesce(address, '') = '' OR coalesce(uprn, '') = '' OR coalesce(registered_provider, '') = '') AND tenure != 'open'").any?
  end

  private

  def calculate_percentage(stat1, stat2)
    ((stat1.to_f / stat2.to_f) * 100).to_i
  rescue ZeroDivisionError, FloatDomainError
    0
  end
end
