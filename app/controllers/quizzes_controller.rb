class QuizzesController < ApplicationController
def index
puts " I am inside the index method"
@quizzes = Quiz.all
respond_to do |format|
format.html 
format.json  {render json: @quiz}
end
end

  def new
 @quiz = Quiz.new
puts " I am inside the new method"
respond_to do |format|
format.html
format.json { render json: @quiz }
end

  end

  def create
puts " I am inside the create method"
@quiz = Quiz.new(params[:quiz])

respond_to do |format|
if @quiz.save 
format.html  { redirect_to @quiz,  notice: 'Quiz Created successfully'}
format.json { render json: @quiz,  status:created, location: @quiz}
else
format.html { render action:  "new" }
format.json { render json: @post.erors, status: :unprocessable_entity }
end
end
end

  def edit
@quiz = Quiz.find(params[:id])
puts " I am inside the edit method"
respond_to  do |format|
format.html
format. json{ render json: @quiz }
end
end
  def update
puts " I am inside the update method"
@quiz = Quiz.find(params[:id])
respond_to do |format|
if   @quiz.update_attributes(params[:quiz])
format.html  { redirect_to @quiz, notice: 'Quiz updated successfully' } 
format.json { header :nocontent }

else
format.html { render action: "edit" }
format.json { render json: @quiz.errors, status:unprocessable_entity }
end
end

end

  def show
puts " I am inside the show method"

@quiz = Quiz.find(params[:id])

respond_to  do |format|
format.html
format.json { render json: @quiz }
end	  
  end

  def destroy
puts " I am inside the destroy method"
@quiz = Quiz.find(params[:id])
@quiz.destroy
respond_to do |format|
format.html { redirect_to quizzes_url }
format.json { head :nocontent }
end
  end
  
def answering
@quiz = Quiz.all
respond_to do |format|
format.html
format.json { render json :@quiz }
end
end

def answer	
@quiz = Quiz.find(params[:id])
respond_to do |format|
format.html
format.json  { render json :@quiz }
end
end

def check
@quiz = Quiz.find(params[:id])
respond_to do |format |
if @quiz.correct_ans == params[:ans][0] .to_i  then
 format.html { redirect_to({ :controller => "quizzes", :action => "answering", :id => @quiz.id }) }
 puts "Answer is correct"
 #format.json { render json : @quiz }	
 else
 puts "Answer is wrong"
 #flash[:notice] => " Answer is wrong "
 format.html { redirect_to({ :controller => "quizzes", :action => "answering" , :id => @quiz.id }) }
 #format.json { render json : @quiz }
 end
 end
#~ respond_to do |format|
#~ format.html
#~ format.json { render json: @quiz }
#~end
end
end