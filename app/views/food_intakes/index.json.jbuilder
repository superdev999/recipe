json.array! @food_intakes do |food_intake|
  json.partial! 'detail', food_intake: food_intake
end
