json.array! @urls do |url|
  json.id url.id
  json.link url.link
  json.h1 url.h_one.pluck(:content)
  json.h2 url.h_two.pluck(:content)
  json.h3 url.h_three.pluck(:content)  
end
