class EmailsController < ApplicationController

  def index
    @email = Email.all
  end

  def create
    @email = Email.new(object: Faker::Hipster.sentence , body: Faker::Hipster.paragraph ,read: false)

    if @email.save
      flash[:notice] = "email received"
    else
      flash[:notice] = "Please try again"
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])

    if @email.read == false
      @email.update(read: true)
    else
      @email.update(read:false)
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end
end
