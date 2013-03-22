class User < ActiveRecord::Base
  has_many :surveys, :through => :completed_surveys
  has_many :created_surveys, :class_name => "Survey", 
                             :foreign_key => "creator_id"
  has_many :choices, :through => :answers
end
