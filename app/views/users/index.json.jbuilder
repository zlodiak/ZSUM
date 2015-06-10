json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password_digest, :session_hash, :phone, :skype, :info, :gender
  json.url user_url(user, format: :json)
end
