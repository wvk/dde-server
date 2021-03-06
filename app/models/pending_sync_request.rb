class PendingSyncRequest < ActiveRecord::Base
  belongs_to :record,
      :polymorphic => true

  def self.get(options = {})
    my_options = options.merge :http_method => 'get'
    request = self.find_or_initialize_by_record_type_and_method_name_and_method_arguments(my_options)
    request.update_attributes!(my_options)
  end

  def self.put(options = {})
    my_options = options.merge :http_method => 'put'
    request = self.find_or_initialize_by_record_type_and_method_name_and_method_arguments(my_options)
    request.update_attributes!(my_options)
  end

  def self.retry_delayed_requests!
    options = SITE_CONFIG[:remote_http_options].to_hash.symbolize_keys
    self.all.each do |pending_request|
      if pending_request.record_type and pending_request.method_name
        begin
          success = pending_request.record_type.constantize.send(pending_request.method_name, *pending_request.method_arguments)
        rescue
          # do nothing, requeueing will be performed by the model
        else
          if success
            pending_request.destroy
          end
        end
      end
    end
  end

  def method_arguments
    ActiveSupport::JSON.decode(self[:method_arguments])
  end

end
