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

  scope :order_by_full_name, -> { order('first_name', 'last_name') }

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    (Date.today - birthdate).to_i / 365
  end
end
