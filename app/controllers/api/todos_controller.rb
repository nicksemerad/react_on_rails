class Api::TodosController < ApplicationController

  def index
    render json: Todo.all
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: { error: @todo.errors }, status: :unprocessable_entity
    end
  end

  def update
    @todo = Todos.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: { error: @todo.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todoo.find(params[:id]).destroy
    render json: { message: 'The todo has been deleted'}
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :complete)
  end

end
