class CreateUsers < ActiveRecord::Migration
  #change method determines the change to be made to the database
  def change
  	#In this case the change method is using the Rails method 'create_table' which accepts a block where |t| represents a table.  
    create_table :users do |t|
      t.string :name #create name column in database
      t.string :email #create email column in database
      t.string :password_digest #For hash function of password

      t.timestamps #create 'created_at' and 'updated_at' columns in database
    end
  end
end
