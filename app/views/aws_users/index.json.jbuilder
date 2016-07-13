json.array!(@aws_users) do |aws_user|
  json.extract! aws_user, :id, :first_name, :last_name, :email
  json.url aws_user_url(aws_user, format: :json)
end
