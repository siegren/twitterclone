class AddAvatarsToTweets < ActiveRecord::Migration
  def self.up
    change_table :tweets do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :tweets, :avatar
  end
end
