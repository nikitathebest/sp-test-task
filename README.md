# SP test task
## Task description
Write a ruby script that (ruby_app):    
* a. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log’
* b. Returns the following:
    * list of webpages with most page views ordered from most pages views to less page views e.g.:
        * `/home 90 visits /index 80 visits etc...` 
    * list of webpages with most unique page views also ordered e.g.:
        * `/about/2 8 unique views /index 5 unique views etc...`

## How to install
  * Clone repository
  * Run
  ```bash
  bundle install 
  ```

## Run app
```bash
ruby parser.rb webserver.log
```

## Run spec
```bash
bundle exerc rspec
```

## Result 
```
Page visits:
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
Unique page views:
/index 23 unique views
/contact 23 unique views
/help_page/1 23 unique views
/about/2 22 unique views
/home 22 unique views
/about 21 unique views
```