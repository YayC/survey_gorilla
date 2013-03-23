class Choice < ActiveRecord::Base
  belongs_to :question
  has_many   :users, :through => :answers

  def num_respondents
    Answer.where("choice_id = ?", self.id).to_a.length
  end

end
