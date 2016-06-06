class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :recipient_id
      t.string :sender_id
      t.text :message_text

      t.timestamps

    end
  end
end
