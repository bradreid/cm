class Tweet
  
  
  DOMAIN_NAME = 'http://search.twitter.com/'
  SEARCH_PATH = "search.atom?q="
  
  attr_accessor :html
  
  
  def initialize
    @username = 'RDI_BU'
  end

  def tweet(message)
    begin
      client.update(message)    
    rescue  
    end
  end
  
  def name
    client.user(@username).name
  end
  
  def user
    client.user(@username)
  end
  
  def messages
    client.user_timeline
  end
  
  def about_me
    a = client.activity_about_me
    a.map do |t|
      case t.class.name
        when "Twitter::Reply" then t.target_objects
        when 'Twitter::Mention' then t.target_objects
        when 'Twitter::Follow' then nil
        when 'Twitter::Retweet' then t.target_objects
        else raise "test"
      end
    end.compact.flatten
  end
  
  def everything
    all = self.messages + self.about_me
    all = all.inject({}){|s,v| s.merge!(v.id => v)}.values
    all.sort!{|x,y| y.created_at <=> x.created_at}    
  end
  
  def destroy_messages
    begin
      self.messages.each do |m|
        client.status_destroy(m[:id])
      end
    # rescue
    end
  end
  
  def client
    begin
      return @twitter_client if @twitter_client
      Twitter.configure do |config|
        config.consumer_key = 'z3vGyg0lUERdgkJ9cO02OA'
        config.consumer_secret = 'yX25GTZqheXtDtGWA9GcQkgOhq8rysVcRIVUGzM7fY'
        config.oauth_token = '569272305-Vay1EtaRGmvGtJtQLKTenDyneJyxWy0N9IGwVGck'
        config.oauth_token_secret = 'xpBWKhvHGDLqpSZadI53DagE30kUnmfbQOGmgdRrkk'                
      end  
      @twitter_client ||= Twitter::Client.new    
    end
  end
end