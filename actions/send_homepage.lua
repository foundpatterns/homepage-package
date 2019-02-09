event: ["homepage_requested"]
priority: 1
input_parameters: ["request"]

local slideshow_id = settings.slideshow
local slideshow_fields = content.read_document(slideshow_id)

local slide_weights = {}

content.walk_documents(nil, function (slide_id, fields, body)
  if fields.model == "slide" and fields.slideshow == slideshow_id then
    table.insert(slide_weights, {
      content = render("homepage-slide.html", {
        img = fields["image-address"],
        title = fields.title,
        body = body,
      }),
      weight = fields.weight or math.maxinteger,
    })
  end
end)

table.sort(slide_weights, function (a, b) return a.weight < b.weight end)
local slides = map(slide_weights, function (it) return it.content end)

local homepage = render("index.html", {
  SITE_URL = "/",
  SITENAME = settings.sitename,
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
