class Tweet < ActiveRecord::Base
  attr_accessible :text, :user_id
  
  validates :text, :presence => true
end
