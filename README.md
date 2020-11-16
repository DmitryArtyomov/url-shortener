# Shortening algorithm
`id` - `short_code` conversion is just a conversion into another base numeral system (in this case base-62), where each value 0-61 is mapped onto an alphabet.

The initial `CHARACTERS` array is shuffled with fixed RNG based on `secret_key_base`, so it persists between launches, and forms an alphabet.

`short_code` itself is not populated into the database. It is being calculated based on `ShortUrl#id` and vice versa.


# Initial Setup

    docker-compose build
    docker-compose up mariadb
    docker-compose run url-shortener-app rails db:migrate
    docker-compose -f docker-compose-test.yml build

# To run migrations

    docker-compose run url-shortener-app rails db:migrate
    docker-compose -f docker-compose-test.yml run url-shortener-rspec rails db:test:prepare

# To run the specs

    docker-compose -f docker-compose-test.yml run url-shortener-rspec

# Run the web server

    docker-compose up

# Adding a URL

    curl -X POST -d "full_url=https://google.com" http://localhost:3000/short_urls.json

# Getting the top 100

    curl localhost:3000

# Checking your short URL redirect

    curl -I localhost:3000/abc
