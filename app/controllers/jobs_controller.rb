class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(
    title: params[:job][:title],
    description: params[:job][:description],
    company: params[:job][:company]
    )
    if @job.save
      redirect_to jobs_path
    else
      render :new 
    end
  end

end
