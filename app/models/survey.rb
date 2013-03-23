class Survey < ActiveRecord::Base
  has_many :completed_surveys
  has_many :users, :through => :completed_surveys
  has_many :questions
  has_many :pictures

  belongs_to :user

  def num_respondents
    CompletedSurvey.where("survey_id = ?", self.id).to_a.length
  end
end
