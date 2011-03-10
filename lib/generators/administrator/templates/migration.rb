class CreateAdministratorsTable < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string 'email'
      t.string 'password_hash'
      t.string 'password_salt'

      t.timestamps
    end
    Administrator::Admin.create(:email => 'admin@email.com', :password => 'admin')
  end

  def self.down
    drop_table :admins
  end
end


