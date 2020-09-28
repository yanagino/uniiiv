class HomesController < ApplicationController
  def top
    @users = User.where(status: "seniors").where.not(school: nil)
  end

end
