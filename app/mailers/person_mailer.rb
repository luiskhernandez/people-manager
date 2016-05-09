class PersonMailer < ApplicationMailer
  default from: 'no-reply@people-manager.com'

  def new_person(person, new_person)
    @person = person
    @new_person = new_person
    mail(to: person.email,
        subject: 'People App - New person added')
  end

  def delete_person(person, deleted_person)
    @person = person
    @new_person = deleted_person
    mail(to: person.email,
        subject: 'People App - Someone has left the app')
  end
end
