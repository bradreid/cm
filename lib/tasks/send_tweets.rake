desc "Send out tweets"
task :send_tweets => :environment do
  if Rails.env == 'production'
    TwitterFeed.send_tweets 
  else
    puts "only in prod"
  end
end