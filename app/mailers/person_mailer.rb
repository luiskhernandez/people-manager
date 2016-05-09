class PersonMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  default from: 'no-reply@people-manager.com'

  def new_person(person, new_person)
    @person = person
    @new_person = new_person
    mail(to: person.email,
         subject: 'People App - New person added')
  end

  def delete_person(person, name)
    @person = person
    @name = name
    mail(to: person.email,
         subject: 'People App - Someone has left the app')
  end
end
