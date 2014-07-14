class BestofsController < ApplicationController

  before_action :authenticate, only: [:new, :create]

  def index
    @bestofs = Bestof.all
  end

  def new
    @bestof = Bestof.new
  end

  def create
    @bestof = Bestof.new(bestof_params)
    @bestof.user_id = session[:current_user]
    if @bestof.save
      redirect_to bestofs_path
    else
      render :new
    end
  end

  private
  def bestof_params
    params.require(:bestof).permit(:image_url, :comment)
  end


end