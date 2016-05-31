class ProtorJob < ActiveJob::Base
  # Set the Queue as Default
  queue_as :default

  def perform(build_id)
    Prontor.new(build_id).make_review
  end
end
