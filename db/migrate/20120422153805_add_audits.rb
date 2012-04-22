class AddAudits < ActiveRecord::Migration
  def self.up
    create_table :server_request_logs, :force => true do |t|
      t.integer :user_id
      t.integer :session_id
      t.integer :tic_id
      t.integer :review_id
      t.string :url
      t.string :section
      t.string :referrer
      t.string :search
      t.timestamps
    end
    
    add_index :server_request_logs, :search
    add_index :server_request_logs, :user_id
    add_index :server_request_logs, :session_id
    add_index :server_request_logs, :tic_id
    add_index :server_request_logs, :review_id
    add_index :server_request_logs, :section
    
  end

  def self.down
    remove_index :server_request_logs, :search
    remove_index :server_request_logs, :section
    remove_index :server_request_logs, :review_id
    remove_index :server_request_logs, :tic_id
    remove_index :server_request_logs, :session_id
    remove_index :server_request_logs, :user_id
    drop_table :server_request_logs
  end
end