require 'test_helper'

class PersonMailerTest < ActionMailer::TestCase
  def setup
    2.times { create(:person) }
    @person = Person.first
  end

  test "new_person" do
    new_person =create(:person)
    email = PersonMailer.new_person(@person, new_person).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ['no-reply@people-manager.com'], email.from
    assert_equal 'People App - New person added', email.subject
  end

  test "delete_person" do
    deleted_person =@person.destroy
    person = Person.first
    email = PersonMailer.delete_person(person, deleted_person).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ['no-reply@people-manager.com'], email.from
    assert_equal 'People App - Someone has left the app', email.subject
  end
end

