class AddCorrectAnsToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :correct_ans, :integer
  end
end
