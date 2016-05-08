class Person < ActiveRecord::Base
  GENDERS = [ 'female', "male"]

  validates :bio, length: { maximum: 500 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 254 }
  validates :first_name, presence: true, length: { maximum: 75 }
  validates :job, length: { maximum: 75 }
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :last_name, presence: true, length: { maximum: 75 }
  validates :birthdate, presence: true
  validates_date :birthdate, on_or_before: lambda { Date.current }
end
