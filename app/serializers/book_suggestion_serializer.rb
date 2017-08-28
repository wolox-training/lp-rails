class BookSuggestionSerializer < ActiveModel::Serializer
  attributes :user, :editorial, :price, :author, :title, :link, :publisher, :year
end
