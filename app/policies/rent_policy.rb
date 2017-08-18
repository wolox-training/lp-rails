class RentPolicy < ApplicationPolicy
  def index?
    @record.all { |rent| rent.user == current_user }
  end
end
