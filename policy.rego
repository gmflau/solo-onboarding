package test

default allow = false
allow {
    startswith(input.http_request.path, "/anything")
    input.http_request.method == "GET"
}
allow {
    input.http_request.path == "/status/200"
    any({input.http_request.method == "GET",
        input.http_request.method == "DELETE"
    })
}
