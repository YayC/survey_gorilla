class Survey < ActiveRecord::Base
  has_many :completed_surveys
  has_many :users, :through => :completed_surveys
  has_many :questions

  belongs_to :user
  mount_uploader :picture, ImageUploader

  def num_respondents
    CompletedSurvey.where("survey_id = ?", self.id).to_a.length
  end
end
