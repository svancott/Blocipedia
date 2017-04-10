class WikisCollaborators < ApplicationRecord
  belongs_to :wiki
  belongs_to :collaborator
end
