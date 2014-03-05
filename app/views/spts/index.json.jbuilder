json.array!(@spts) do |spt|
  json.extract! spt, :id
  json.url spt_url(spt, format: :json)
end
