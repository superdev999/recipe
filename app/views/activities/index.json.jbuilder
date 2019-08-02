json.array! @activities do |activity|
  json.partial! 'detail', activity: activity
end
