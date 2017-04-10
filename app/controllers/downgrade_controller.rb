class DowngradeController < ApplicationController

  def downgrade
    @id = current_user.id
    @user = current_user
    @user.update_attributes!(role: 'standard')
    @wikis = Wiki.where(user_id: @id)
    @wikis.each do |wiki|
      if wiki.private == true
        wiki.update_attributes!(private: false)
      end
    end
    if @user.save
      flash[:notice] = "Account was updated."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error updating your account. Please try again."
      render edit_user_registration_path
    end
  end
end
