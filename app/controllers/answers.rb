get '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'answers/index'
end

get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answers/new'
end

post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.new(params[:answer])
  @answer.assign_attributes(question_id: @question.id)
  @answer.save
  redirect '/questions/:id/answers'
end

# don't need to show indiv answer unless editing
# get '/questions/:id/answers/:answer_id' do
#   @question = Question.find(params[:id])
#   @answer = Answer.find(params[:answer_id])
#   erb :'answers/show'
# end

get '/questions/:id/answers/:answer_id/edit' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  erb :'answers/edit'
end

put '/questions/:id/answers/:answer_id' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  @answer.update_attributes(params[:answer])
  redirect '/questions/:id/answers'
end

delete '/questions/:id/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @answer.destroy
  redirect '/questions/:id/answers'
end
