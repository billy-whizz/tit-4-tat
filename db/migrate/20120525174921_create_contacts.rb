class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :organisation
      t.text :enquiry

      t.timestamps
    end
  end
end
