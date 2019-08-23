class Dwelling < ApplicationRecord
  belongs_to :development
  has_many :audit_logs

  default_scope { order(created_at: :asc) }

  Tenures = %w[open social intermediate].freeze
  REGISTERED_PROVIDERS = [
    'A2Dominion',
    'Arhag',
    'Ash-Shahada',
    'CCHT',
    'CDS',
    'Clarion',
    'Co-op',
    'Family Mosaic'
  ].freeze

  scope :open, -> { where(tenure: 'open') }
  scope :affordable, -> { where("tenure != 'open'") }
end
