class CompletedSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
  validate :must_answer_all_questions
 
  def must_answer_all_questions
    user_question_ids = User.find(self.user_id).answered_questions.map{|q| q.id}.uniq
    survey_question_ids = Survey.find(survey_id).questions.map{|q| q.id}.uniq
    
    
    
    user_question_ids.uniq.sort

    unless (survey_question_ids - user_question_ids).empty?
      errors.add(:survey_incomplete, "-- please answer all required questions")
    end
  end
 

end
