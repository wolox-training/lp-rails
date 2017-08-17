class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :book, :user
  def from
    object.from.change(usec: 0)
  end

  def to
    object.to.change(usec: 0)
  end
end
