class Choice < ActiveRecord::Base
  belongs_to :question
  has_many   :users, :through => :answers
end
