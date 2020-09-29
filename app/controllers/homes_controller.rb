class HomesController < ApplicationController
  def top
    @users = User.where(status: "seniors").where.not(school: nil).where.not(school: "")
  end

end
