priority: 1
input_parameter: "request"
events_table: ["about_requested"]

request.method == "GET"
and
#request.path_segments == 0
and
request.query.about
