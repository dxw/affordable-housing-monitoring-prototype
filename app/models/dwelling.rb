class Dwelling < ApplicationRecord
  belongs_to :development

  Tenures = %w[open social intermediate].freeze

  scope :open, -> { where(tenure: 'open') }
  scope :affordable, -> { where("tenure != 'open'") }
end
