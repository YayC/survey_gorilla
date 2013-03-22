require 'faker'

100.times do
  user = User.new name: Faker::Name.name, email: Faker::Internet.email)
  user.password = Faker::Lorem.word
  user.save
end

u = User.new(name: "test", email: "test@example.com"); u.password="test"; u.save


100.times do |i|
  surv = Survey.create(creator_id: rand(1..100), title: Faker::Lorem.sentence(rand(1..4)), description: Fake::Lorem.paragraph(rand(1..2)))
  rand(5..15).times do
    question = Question.create(content: Faker::Lorem.sentence(rand(1..2)) + "?")
      4.times do
        choice = Choice.create(content: "a fake answer is #{ Faker::Lorem.word}")
        question.choices << choice
      end
    surv.questions << question
  end
end

100.times do
  cs = completed_surveys.create( user_id: rand(1..100), survey_id: rand(1..100))
  Survey.find(cs.survey_id).questions.each do |question|
    choice_id = question.choices.sample.id
    Answer.create( choice_id: choice_id, user_id: cs.user_id)
  end
end

