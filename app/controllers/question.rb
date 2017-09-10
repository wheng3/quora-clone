#Show all the questions
get '/questions' do
	@questions = Question.all
	erb :"questions/index"
end

#Show question #id and all its answers
get '/questions/:id' do
	@question = Question.find(params[:id])
	if @question
		@answers = Answer.where(question_id: @question.id)
		erb :"questions/show"
	else
		redirect '/'
	end
end

#direct to question  creation form
get '/users/:id/questions/new' do
	erb :"questions/new"
end

#create new question
post '/users/:id/questions' do
	@question = Question.new(title: params[:question][:title], description: params[:question][:description], user_id: current_user.id)
	if @question.save
		@message = "Question successfully created"
	else
		@message = "Failed to create question"
	end
	erb :"questions/new"
end