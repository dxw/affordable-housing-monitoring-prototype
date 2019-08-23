class AuditLog < ApplicationRecord
  belongs_to :development
  belongs_to :dwelling
end
