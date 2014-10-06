class CreateUsers < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.belongs_to :follower
      t.belongs_to :user
      t.timestamps
    end
  end
end
