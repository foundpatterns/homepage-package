event: ["homepage_requested"]
priority: 1
input_parameters: ["request"]

local homepage = render("index.html", {
  SITE_URL = "/",
  SITENAME = "Lighttouch",
  articles = {}
})

return {
  status = 200,
  headers = {
    ["content-type"] = "text/html",
  },
  body = homepage
}
