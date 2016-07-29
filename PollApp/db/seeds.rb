# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(user_name: "Obama")
User.create(user_name: "Bush")
User.create(user_name: "Michelle Obama")
User.create(user_name: "Snoop Dogg")

Poll.create(title: "Sports", author_id: 1)
Poll.create(title: "News", author_id: 2)

Question.create(text: "Should basketball be illegal?", poll_id: 1)
Question.create(text: "Should baseball be illegal?", poll_id: 1)
Question.create(text: "is global warming real?", poll_id: 2)

AnswerChoice.create(text: "Yes", question_id: 1)
AnswerChoice.create(text: "No", question_id: 1)

AnswerChoice.create(text: "Yes", question_id: 2)
AnswerChoice.create(text: "No", question_id: 2)
AnswerChoice.create(text: 'yes', question_id: 3)

Response.create(user_id: 3, answer_choices_id: 5)
Response.create(user_id: 2, answer_choices_id: 1)
Response.create(user_id: 2, answer_choices_id: 4)
Response.create(user_id: 3, answer_choices_id: 1)
Response.create(user_id: 3, answer_choices_id: 3)
Response.create(user_id: 4, answer_choices_id: 1)
Response.create(user_id: 4, answer_choices_id: 3)
