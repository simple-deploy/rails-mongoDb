class Article
  include Mongoid::Document
  field :name, type: String
  field :title, type: String
end
