#Show all the users
get '/users' do
	@users = User.all
	erb :"users/index"
end

#Create new user
post '/users' do
	@user = User.new(params[:user])
	if @user.save
		@signup_message = "Successfully created user"
	else
		@signup_message = "Failed to register user"
	end
	erb :"static/index"
end

#Show profile of a user
get '/users/:id' do
  @user = User.find(params[:id])
  if @user
  	erb :"users/show"
  else
  	redirect '/'
  end
end

#Show questions of a user
get '/users/:id/questions' do
	@user = User.find(params[:id])
	@questions = @user.questions
	erb :"users/questions"
end

#Show answers of a user
get '/users/:id/answers' do
	@user = User.find(params[:id])
	@answers = @user.answers
	erb :"users/answers"
end