class SpamReport < ApplicationRecord
  alias_attribute :type, :report_type

  enum report_type: { SpamNotification: 0, HardBounce: 1, SoftBounce: 2, Delivery: 3 }

  validates :record_type, :report_type, :type_code,
            :name, :message_stream, :description, :email, :from, :bounced_at, presence: true
  validates :email, :from, format: { with: EMAIL_PATTERN }
end
