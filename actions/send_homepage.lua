event: ["homepage_requested"]
priority: 1
input_parameters: ["request"]

local slideshow_id = "c800a360-d198-4a87-877e-b353f7dd0a9d"
local slideshow_fields = content.read_document(slideshow_id)

local slides = {}
content.walk_documents(nil, function (slide_id, fields, body)
  if fields.model == "slide" and fields.slideshow == slideshow_id then
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
