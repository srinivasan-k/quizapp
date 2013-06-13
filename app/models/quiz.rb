class Quiz < ActiveRecord::Base
  attr_accessible :answer1, :answer2, :answer3, :answer4, :question, :correct_ans
  validates_presence_of :question, :answer1, :answer2, :answer3, :answer4
  validates_numericality_of :correct_ans
end
