class AnswerChoice < ActiveRecord::Base
  validates :text, :question_id, presence: true

  belongs_to :question,
    foreign_key: :question_id,
    class_name: :Question

  has_many :responses,
    foreign_key: :answer_choices_id,
    class_name: :Response
end
