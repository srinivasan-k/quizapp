class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.text :question
      t.text :answer1
      t.text :answer2
      t.text :answer3
      t.text :answer4

      t.timestamps
    end
  end
end
