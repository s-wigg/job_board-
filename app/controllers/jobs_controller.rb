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

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    result = @job.update({
      title: params[:job][:title],
      description: params[:job][:description],
      company: params[:job][:company]
      })
      if result
        redirect_to job_path(@job.id)
      else
        render :edit
      end
  end

  def delete
    job = Job.find(params[:id])

    if job.destroy
      redirect_to jobs_path
    else
    end 
  end

end
