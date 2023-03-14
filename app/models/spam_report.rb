class SpamReport < ApplicationRecord
  alias_attribute :type, :report_type

  enum report_type: { SpamNotification: 0, HardBounce: 1, SoftBounce: 2, Delivery: 3 }

  validates :record_type, :report_type, :type_code,
            :name, :message_stream, :description, :email, :from, :bounced_at, presence: true
  validates :email, :from, format: { with: EMAIL_PATTERN }

  after_create_commit :notify_on_slack, if: :spam_notification?

  private

  def spam_notification?
    SpamNotification? && type_code.eql?(SPAM_CODE)
  end

  def notify_on_slack
    message = I18n.t('spam_report.notify',
                    email: email,
                    type: report_type,
                    description: description)

    SLACK_CLIENT.chat_postMessage(channel: "##{ENV['SLACK_CHANNEL_NAME']}", text: message, as_bot: true)
  end
end
