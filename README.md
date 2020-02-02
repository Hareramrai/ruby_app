# Web Server Log Parser

**Problem Statement**

The test is as follows:

1. ruby_app

Write a ruby script that:
a. Receives a log as argument (webserver.log is provided)

e.g.: ./parser.rb webserver.log

b. Returns the following:

> list of webpages with most page views ordered from most pages views to less page views e.g.:

/home 90 visits
/index 80 visits
etc...

> list of webpages with most unique page views also ordered
e.g.:

/about/2 8 unique views
/index 5 unique views
etc...


**Example**

To install all dependencies, compile and run tests:

> $ bin/setup

To run the code so it accepts input from a file:

> $ bin/parser data/webserver.log

**Output (to STDOUT):**

````
List of webpages with most page views ordered
Webpage(Endpoint)      Count
/about/2                         90 visits
/contact                         89 visits
/index                           82 visits
/about                           81 visits
/help_page/1                     80 visits
/home                            78 visits

List of webpages with most unique page views also ordered
Webpage(Endpoint)      Count
/help_page/1                     23 unique views
/contact                         23 unique views
/index                           23 unique views
/home                            23 unique views
/about/2                         22 unique views
/about                           21 unique views

````

The `Web Server Log Parser` is a ruby 2.6 application used to parse web server log to generate stats.

## Requirements

This ruby project uses:
1. `Ruby 2.6.2`
2. `dry-rb`
3. `priority_queue_cxx`


## Project Structure

The application follows the typical structure of a ruby application and main code snippets are in lib folder. We are using priority queue to handle the ordering of report. Data with maximum count will have maximum priority.

Application specs in spec folder.

## Testing

All the tests are located in the `spec`  folder of the application.
To run spec with coverage report: `SIMPLECOV=true bundle exec rspec`
