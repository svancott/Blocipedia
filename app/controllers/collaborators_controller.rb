class CollaboratorsController < ApplicationController
  def new
    @collaborator = Collaborator.new
  end
end
