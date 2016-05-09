class Notify
  class << self
    def everyone
      Person.all
    end

    def send_new_person_mail(person)
      lambda do |p|
        PersonMailer.new_person(p, person).deliver_later
      end
    end

    def send_delete_peson_mail(person)
      lambda do |p|
        PersonMailer.delete_person(p, person).deliver_later
      end
    end
    def all_people_but_me(person)
      Person.where.not(id: person.id)
    end

    def new_person(person)
      notify(all_people_but_me(person), send_new_person_mail(person))
    end

    def delete_person(full_name)
      notify(everyone, send_delete_peson_mail(full_name))
    end

    def notify(array, block)
      array.find_each(&block)
    end
  end
end
