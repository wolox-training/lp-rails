class RentPolicy < ApplicationPolicy
  def index?
    @record == current_user.id
  end
end
