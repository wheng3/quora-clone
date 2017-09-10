#Direct to a form to reply answer on question #id
get '/questions/:id/answers/new' do
	@question = Question.find(params[:id])
	erb :"answers/new"
end

#Submit answer to question #id
post '/questions/:id/answers' do
	@question = Question.find(params[:id])
	@answer = Answer.new(comment: params[:comment], question_id: params[:id], user_id: current_user.id)
	if @answer.save
		@message = 'Answer successfully submitted'
	else
		@message = 'Answer failed to submit'
	end
	erb :"answers/new"
end