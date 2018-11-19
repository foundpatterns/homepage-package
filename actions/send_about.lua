event: ["about_requested"]
priority: 1
input_parameters: ["request"]

local about = fs.read_file("about.md")

return {
  status = 200,
  headers = {
    ["content-type"] = "text/html",
  },
  body = markdown_to_html(about)
}
