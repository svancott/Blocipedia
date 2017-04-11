class CollaboratorsController < ApplicationController
  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new
    @collaborator.wiki_id = params[:collaborator][:wiki_id]
    @collaborator.user_id = params[:collaborator][:user_id]

    if @collaborator.save
      flash[:notice] = "Collaborator was saved."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error saving the Collaborator. Please try again."
      render :new
    end
  end

  def destroy
  end

end
