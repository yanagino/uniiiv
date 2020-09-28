class HomesController < ApplicationController
  def top
    @users = User.where(status: "seniors")
  end

end
