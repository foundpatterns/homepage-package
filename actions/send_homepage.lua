event: ["homepage_requested"]
priority: 1
input_parameters: ["request"]

local slideshow_id = "56d2cd3e-5357-455d-9cd4-94aa0191db8e"
local slideshow_fields = content.read_document(slideshow_id)

local slides = {}
content.walk_documents("+model:slide", function (slide_id, fields, body)
  if fields.slideshow == slideshow_id then
    table.insert(slides, render("homepage-slide.html", {
      img = fields["image-address"],
      title = fields.title,
      body = body,
    }))
  end
end)

local homepage = render("index.html", {
  SITE_URL = "/",
  SITENAME = torchbear.settings.sitename,
  articles = {},
  slides = slides,
})

return {
  status = 200,
  headers = {
    ["content-type"] = "text/html",
  },
  body = homepage
}
