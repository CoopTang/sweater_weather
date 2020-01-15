
# Sweater Weather
A back-end api that exposes endpoints for the weather of a location, the creation and authentication of users, and road trip information for authenticated users

## Tech/framework used
<b>Built with</b>
- [Rails 6.0.2.1](https://rubyonrails.org/)

## Installation
### Requirements
- [Ruby 2.6.3](https://github.com/ruby/ruby)
- [Rails 6.0.1](https://rubyonrails.org/)
- [PostgreSQL-11](https://www.postgresql.org/)

Once these are installed, clone the repository to your local machine 

Once cloned onto your computer, `cd` into the project directory and run `bundle install ` to install all required gems for the project.

**Database Setup**

Run the following command to set up the database

`rails db:{drop,create,migrate,seed}`

## API Reference
All endpoints require the following headers:
```json
"Content-Type": "application/json",
"Accept": "application/json"
```

---

### Forecast
`GET /api/v1/forecast?location=<LOCATION>`

Returns the current weather, the weather for the next 48 hours, and the weather for the next week. The user will get the following response:
```json
{
  "data": {
    "id": "1",
    "type": "forecast",
    "attributes": {
      "id": 1,
      "timezone": "America/Denver"
      "currently": {
        "time": 1579111681,
        "summary": "Clear",
        "icon": "clear-day",
        "temperature": 42.32,
        "apparent_temperature": 42.16,
        "humidity": 0.31,
        "visibility": 10,
        "uv_index": 2
      },
      "hourly": [
        {
          "time": 1579111200,
          "summary": "Clear",
          "icon": "clear-day",
          "temperature": 41.57
        },
        {...}
      ],
      "daily": [
        {
          "temperature_low": 22.26,
          "temperature_high": 51.71,
          "precip_probability": 0.04,
          "precip_type": "snow"
        },
        {...}  
      ]
    }
  }
}
```
Note: if an invalid location is given, the default response will be for Denver, CO

---

### Background
`GET /api/v1/backgrounds?location=<LOCATION>`

Returns the URL for an image by the given location in the following format:
```json
{
  "data": {
    "id": "1",
    "type": "background",
    "attributes": {
      "id": 1,
      "url": "<IMAGE URL>"
    }
  }
}
```

Note: if and invalid location is input, the user will be returned the image of a dog.

---

### User Registration
`POST /api/v1/users`

This endpoint requires a body with the following format:
```json
{
  "email": "bob@bob.example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
If the registration is successful, the user will get the following response body:

```json
{
  "api_key": "<YOUR API KEY>"
}
```

An unsuccessful registration will return a response stating the reason in the folloiwng format:
```json
{
  "message": "Password confirmation doesn't match Password"
}
```

---

### User Authentication
`POST /api/v1/sessions`

This endpoint requires a body with the following format:
```json
{
  "email": "bob@bob.example.com",
  "password": "password"
}
```

If the user inputs the correct information, the user will get the following response:

```json
{
  "api_key": "<YOUR API KEY>"
}
```

If the user inputs the incorrect information, such as wrong email or password, the user will get the following response:

```json
{
  "message": "Unauthorized"
}
```

---

### Road Trip
`POST /api/v1/road_trip`

This endpoint requires a body with the following format:
```json
{
  "origin": "<ORIGIN>",
  "destination": "<DESTINATION>",
  "api_key": "<YOUR API KEY>"
}
```

If the api_key is valid, then the user will be in the following format:
```json
{
  "data": {
    "id": "1",
    "type": "road_trip",
    "attributes": {
      "id": 1,
      "origin": {
        "city": "Denver",
        "state": "CO"
      },
      "destination": {
        "city": "Pueblo",
        "state": "CO"
      },
      "travel_time": "1 hour 48 mins",
      "arrival_forecast": {
        "time": 1579118262,
        "summary": "Clear",
        "icon": "clear-day",
        "temperature": 46.29,
        "apparent_temperature": 41.32,
        "humidity": 0.12,
        "visibility": 10,
        "uv_index": 2
      }
    }
  }
}
```

Note: if the API cannot find a route between the origin and destination, the default route will be Denver, CO and Pueblo, CO.

---

## Tests
[RSpec](https://github.com/rspec/rspec-rails) is the testing framwork used for testing.

**To run all tests**

`bundle exec rspec`

This will run all tests in the `/spec` directory.


**To run an entire test file**

`bundle exec rspec spec/<path to specifc test>`

**To run a specific test in a file**

`bundle exec rspec spec/<path to specifc test>:<line number of the test>`


## How to use?
To start the server and view the site from the browser, start the server with `rails s` . By default, the server runs on http://localhost:3000