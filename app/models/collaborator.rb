class Collaborator < ApplicationRecord
  has_many :wikis_collaborators
  has_many :wikis, through: :wikis_collaborators
end
