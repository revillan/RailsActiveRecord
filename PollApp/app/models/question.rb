class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  has_many :answer_choices,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def n_plus_one_results
    answers = self.answer_choices
    results = {}

    answers.each do |answer|
      results[answer] = answer.responses.count
    end

    results
  end

  def includes_results
    puts 'here'
    answers = self.answer_choices.includes(:responses)
    results_hash = {}

    answers.each do |answer|
      results_hash[answer.text] = answer.responses.length
    end

    results_hash
  end

  # answers_with_responses = Question.find_by_sql(<<-SQL)
  #   SELECT answer_choices.id, COUNT(responses.id) AS count
  #   FROM answer_choices
  #   LEFT OUTER JOIN responses
  #   ON responses.answer_choices_id = answer_choices.id
  #   WHERE answer_choices.question_id = 1
  #   GROUP BY answer_choices.id
  # SQL

  def results
    answers_with_count = self
      .answer_choices
      .select("answer_choices.*, COUNT(responses.id) AS response_count")
      .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choices_id")
      .group("answer_choices.id")

    answers_count_hash = {}

    answers_with_count.map do |answer|
      answers_count_hash[answer.text] = answer.response_count
    end

    answers_count_hash
  end
end
