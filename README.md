# README

Upload images and see where they've been accessed from!

Check it out on Heroku: http://imagemapper.herokuapp.com/

Quick summary:

  - Styles: Sass / bourbon / neat / refills  
  - JS: Google Geocoder / jQuery / refills
  - CanCanCan for authorization
  - Gon to store event objects in window.gon
  - AWS SDK / Papertrail for storing images on S3
  - Figaro for local dev config 
  - Devise for users 
  - Client-side event tracking with Google Geocoder (switched from server-side initially using geocoder gem)

## Simulate Events

From the image page that you want to test:

    $.get("http://ipinfo.io/some.ip.to.test", function(response) {
      console.log(response);
      $.ajax({
        url: window.location + "/update",
        method: "post",
        data: {
          ip: response.ip,
          lat: response.loc.split(",")[0],
          lon: response.loc.split(",")[1]
        }
      });
    }, "jsonp");

i.e. http://ipinfo.io/8.8.8.8

## TO DO

  - Write tests!
  - Improve styling!
  - Try a slick d3 map instead of the standard Google Map

