json.array! @users do |user|
  json.partial! 'detail', user: user
end
