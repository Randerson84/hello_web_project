1. Design the Route Signature
You'll need to include:

the HTTP method
the path
any query parameters (passed in the URL)
or body parameters (passed in the request body)
POST 
/albums
title(string)
release_year(int)
artist_id(int)

2. Design the Response
The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return 200 OK if the post exists, but 404 Not Found if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

Replace the below with your own design. Think of all the different possible responses your route will return.
```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

when query param 'names' is 'Joe,Alice,Zoe,Julia,Kieran'

Alice,Joe,Julia,Kieran,Zoe

```
3. Write Examples
Replace these with your own design.

# Request:

POST /sort-names?names=Joe,Alice,Zoe,Julia,Kieran

Alice,Joe,Julia,Kieran,Zoe

4. Encode as Tests Examples
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /" do
    it should return "Alice,Joe,Julia,Kieran,Zoe"' do
        response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')

        expect(response.status).to eq(200)
        expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')   
    end
  end
end
5. Implement the Route
Write the route and web server code to implement the route behaviour.