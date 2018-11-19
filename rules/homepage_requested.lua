priority: 1
input_parameter: "request"
events_table: ["homepage_requested"]

request.method == "GET"
and
#request.path_segments == 0
and
count_pairs(request.query) == 0
