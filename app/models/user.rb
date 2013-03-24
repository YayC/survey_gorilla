class User < ActiveRecord::Base
  has_many :completed_surveys
  has_many :surveys, :through => :completed_surveys
  has_many :answers
  has_many :choices, :through => :answers

  has_many :created_surveys, :class_name => "Survey", 
                             :foreign_key => "creator_id"
  has_many :choices, :through => :answers
  
  validates :email, :presence => true, :uniqueness => true
  validates :email, :format => { :with => /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/ }
  validates :name, :presence => true, :format => {:with => /J|j|\w\w+/ }

  include BCrypt

  def answered_questions
    self.choices.map{|c| c.question}
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
