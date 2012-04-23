class ServerRequestLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :tic, :class_name => 'Tool'
end
