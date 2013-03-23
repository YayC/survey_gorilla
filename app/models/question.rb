class Question < ActiveRecord::Base
  belongs_to :survey
  has_many   :choices

  def answers
    associated_choices = self.choices.map{ |c| c.id }
    @answers = []
    associated_choices.each do |choice_id|
      @answers << Answer.where("choice_id = ?", choice_id)
    end
  end

  def num_respondents
    answers.length
  end
end
