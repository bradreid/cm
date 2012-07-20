desc "Copy paperclip data"
task :copy_paperclip_data => :environment do
  @tools = Tool.all
  @tools.each do |tool|
    unless tool.source_document_file_name.blank?
      filename = Rails.root.join('public', 'system', 'original', tool.source_document_file_name)
 
      if File.exists? filename
        image = File.new filename
        tool.source_document = image
        tool.save
 
        image.close
      else
        puts "count not find doc for tool #{tool.id}: #{tool.source_document_file_name}"
      end
    end
  end
end