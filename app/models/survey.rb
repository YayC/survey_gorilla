class Survey < ActiveRecord::Base
  has_many :users, :through => :completed_surveys
  has_many :questions

  belongs_to :author, :foreign_key => "creator_id", :class_name => "User"
end
