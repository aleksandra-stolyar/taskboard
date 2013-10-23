class TasksController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
		@task = @project.tasks.new(task_params)
		if @task.save
		  redirect_to project_path(@project)
		else
			  render controller: 'projects', action: :new
		end
	end

	def destroy
		@project = Project.find(params[:project_id])
		@task = @project.tasks.find(params[:id])
		@task.destroy
		redirect_to project_path(@project)
	end

	def edit
		@project = Project.find(params[:project_id])
		@task = @project.tasks.find(params[:id])
	end

	def update
		@project = Project.find(params[:project_id])
		@task = @project.tasks.find(params[:id])

		@task.update(task_params)

		head :ok
	end

	private

	def task_params
		params.require(:task).permit(:name, :priority, :deadline, :is_done)
	end
end