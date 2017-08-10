class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :publisher, :image, :year, :genre

end
