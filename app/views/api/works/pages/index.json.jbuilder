json.array! @pages do |page|
  json.(page, :id, :matter, :work_id)
end
