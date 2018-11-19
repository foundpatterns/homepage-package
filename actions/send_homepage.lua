event: ["homepage_requested"]
priority: 1
input_parameters: ["request"]

local homepage = render("index.html", {})

return {
  status = 200,
  headers = {
    ["content-type"] = "text/html",
  },
  body = homepage
}
