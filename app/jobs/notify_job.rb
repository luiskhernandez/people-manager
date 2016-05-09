class NotifyJob < ActiveJob::Base
  queue_as :default

  def perform(action: , person:)
    case action
    when 'create'
      Notify.new_person(person)
    when 'destroy'
      Notify.delete_person(person)
    end
  end
end
