class ProjectsController < ApplicationController
	 http_basic_authenticate_with name: "user", password: "pass", except: [:index, :show]
  def index
  	@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to action: :show, id: @project
		else 
			render 'new'
		end
	end

	def show
		@project = Project.find(params[:id])
		@task = Task.new
	end

	def edit 
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		@project.update(project_params)
		head :ok
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		redirect_to projects_path
	end

	def project_params
	params.require(:project).permit(:name, :description, sort: [])
	end

end