json.array!(@guestbooks) do |guestbook|
  json.extract! guestbook, :id
  json.url guestbook_url(guestbook, format: :json)
end
