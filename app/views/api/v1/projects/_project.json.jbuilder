json.sys do
  json.id project.id
  json.type project.class.name
end

json.extract! project, :title
