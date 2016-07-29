class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many :authored_polls,
    foreign_key: :author_id,
    class_name: :Poll

  has_many :responses_made,
    foreign_key: :user_id,
    class_name: :Response

  # polls_questions_count = Poll.find_by_sql(<<-SQL)
  #   SELECT polls.*, COUNT(questions.poll_id) AS poll_count
  #   FROM polls
  #   JOIN questions
  #   ON questions.poll_id = polls.id
  #   GROUP BY polls.id
  # SQL
  polls.id, poll_count, user_questions
  polls_questions_count = Poll.find_by_sql(<<-SQL)
    SELECT *
    FROM
    (
      SELECT polls.*, COUNT(questions.poll_id) AS poll_count
      FROM polls
      JOIN questions
      ON questions.poll_id = polls.id
      GROUP BY polls.id
    ) as poll_questions
    JOIN
      (
        SELECT polls.*, COUNT(responses.*)
        FROM responses
        JOIN answer_choices
        ON responses.answer_choices_id = answer_choices.id
        JOIN questions
        ON answer_choices.question_id = questions.id
        JOIN polls
        ON questions.poll_id = polls.id
        WHERE responses.user_id = 3
        GROUP BY polls.id
      ) as user_responses
    ON poll_questions.id = user_responses.id
  SQL
  #second q
  # JOIN answer_choices
  # ON questions.id = answer_choices.question_id
  #
  # LEFT OUTER JOIN responses
  # ON responses.user_id = self.id

  # SELECT polls.id, COUNT(questions.poll_id) AS user_poll_count
  # JOIN questions
  # ON answer_choices.question_id = questions.id
  # GROUP BY questions.poll_id


end
