class AddToolDescriptionAttributes < ActiveRecord::Migration
  def self.up
    add_column :tools, :author, :string
    add_column :tools, :date_created, :date
    add_column :tools, :language, :string
    add_column :tools, :relevant_pages, :string
    add_column :tools, :total_pages, :integer
    add_column :tools, :description, :text
    add_column :tools, :source_document_file_name, :string
    add_column :tools, :source_document_content_type, :string
    add_column :tools, :source_document_file_size, :integer
    add_column :tools, :source_document_updated_at, :datetime
  end

  def self.down
    remove_column :tools, :source_document_updated_at
    remove_column :tools, :source_document_file_size
    remove_column :tools, :source_document_content_type
    remove_column :tools, :source_document_file_name
    remove_column :tools, :description
    remove_column :tools, :total_pages
    remove_column :tools, :relevant_pages
    remove_column :tools, :language
    remove_column :tools, :date_created
    remove_column :tools, :author
  end
end