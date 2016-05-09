class NotifyJob < ActiveJob::Base
  queue_as :default

  def perform(action: , person:)
    case action
    when 'create'
      Person.where.not(id: person.id).find_each do |p|
        PersonMailer.new_person(p, person).deliver_later
      end
    when 'destroy'
      Person.find_each do |p|
        PersonMailer.delete_person(p, person).deliver_later
      end
    end
  end
end
