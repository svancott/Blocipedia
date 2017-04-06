class Charge < ApplicationRecord
  # after_create :upgrade_to_premium
  #
  # def upgrade_to_premium
  #   current_user.update_attributes!(role: 'premium')
  # end
end
