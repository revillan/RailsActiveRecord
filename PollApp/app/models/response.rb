class Response < ActiveRecord::Base
  validate :not_duplicate_response, :not_rigged_response

  belongs_to :answer_choice,
    foreign_key: :answer_choices_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  def respondent_is_poll_creator?
    self.question.poll.author.id == self.id
  end

  def not_rigged_response
    if respondent_is_poll_creator?
      errors[:respondent] << "is rigging the poll!"
    end
  end

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:respondent] << "already answered"
    end
  end
end
