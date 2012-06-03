class TwitterFeed 
  
  def self.twitter_client
    @client ||= Tweet.new
  end
  
  def self.pending_tweets
    @tools = Tool.where :last_shared_at => nil
    @reviews =  Review.where :active => true, :last_shared_at => nil
    (@tools + @reviews).select{|obj| (obj.created_at + 30.minutes) <= Time.now}
  end  
  
  def self.send_tweets
    return if Rails.env != 'production'
    self.pending_tweets.each do |t|
      t.update_attribute :last_shared_at, Time.now
      self.twitter_client.tweet t.twitter_message
    end
  end
end