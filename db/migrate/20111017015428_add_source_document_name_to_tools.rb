class AddSourceDocumentNameToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :source_document_name, :string
  end

  def self.down
    remove_column :tools, :source_document_name
  end
end
