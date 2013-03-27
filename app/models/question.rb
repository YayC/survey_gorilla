class Question < ActiveRecord::Base
  belongs_to :survey
  has_many   :choices
  has_many :pictures

  def answers
    associated_choices = self.choices.map{ |c| c.id }
    @answers = []
    associated_choices.each do |choice_id|
      Answer.where("choice_id = ?", choice_id).each do |answer|
        @answers << answer
      end
    end

    @answers
  end

  def num_respondents
    answers.length
  end
end
