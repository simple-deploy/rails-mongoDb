class Project
  include Mongoid::Document
  field :title, type: String
  embedded_in :user
end
