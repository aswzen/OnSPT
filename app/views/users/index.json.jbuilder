json.array!(@users) do |user|
  json.extract! user, :id, :nama_depan, :nama_belakang, :jabatan, :email
  json.url user_url(user, format: :json)
end
