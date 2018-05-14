## Scrapping API
----
This app will help you in scrapping any website. Just give the URL of that web-page which you want to scape and it will give back you a json response having keys h1, h2, and h3 with a array as their value. The elements of that array are the scraped data.

## Setup

Follow the instructions below to setup this app:

* Move to the folder where you want to keep this app
* git clone https://github.com/Ronaq13/scraping.git
* cd scraping
* bundle install
* rails db:create && rails db:migrate && rails db:seed

> Run the test suite to be sure about working of app

* bundle exec rspec spec/

If all test passes then we are good to go

Launch server by: rails s

## Example

Format of any response will be like:
```json
{
    "id": "id of url, it will be of a number type",
    "link": "the url you wanted to scrape",
    "h1": [ "list of content of all the h1 tags" ],
    "h2": [ "list of content of all the h2 tags" ],
    "h3": [ "list of content of all the h3 tags" ]     
}
```

### Get requests

* GET request to https://localhost:3000/v1/url

    This will list all the urls present in the database. If you are just starting now then you will have only one url in the database which was created by seed file.

* GET request to https://localhost:3000/v1/url/:id

    This will show you a specific url

* POST request to https://localhost:3000/v1/url with params like:
    ```json
    {
        "link": "<link to web-page you want to scrape>"
    }
    ```
    This will create a record with its scrape data and return back the saved object with its scraped data.

* DELETE request to https://localhost:3000/v1/url/:id

    This will delete the specific record (:id) of url along with its data. 