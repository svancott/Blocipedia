class Wiki < ApplicationRecord
  belongs_to :user
  has_many :wikis_collaborators
  has_many :collaborators, through: :wikis_collaborators
end
