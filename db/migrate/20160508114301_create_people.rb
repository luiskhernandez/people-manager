class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: true, unique: true
      t.string :job
      t.text   :bio
      t.string :gender
      t.date   :birthdate
      t.string :picture

      t.timestamps null: false
    end
  end
end
