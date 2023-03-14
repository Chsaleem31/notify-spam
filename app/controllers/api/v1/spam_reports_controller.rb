module Api
  module V1
    class SpamReportsController < ApplicationController
      # POST: api/v1/spam_reports
      def create
        @report = SpamReport.create report_params
        if @report.persisted?
          render json: @report, status: :ok
        else
          render json: { message: @report.errors.full_messages.to_sentence }, status: :unprocessable_entity
        end
      end

      private

      def report_params
        params.permit(:record_type, :type, :type_code, :name, :tag,
                      :message_stream, :description, :email, :from, :bounced_at)
      end
    end
  end
end
