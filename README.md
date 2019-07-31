# Bien
Bien is a restaurant review application built with Ruby on Rails 5.2.3. [View the production site here](https://nameless-anchorage-30307.herokuapp.com/). 

## Goal
To build a full-stack application with user authentication, user-generated content and a geolocation search tool. 

#### Timeframe
Two weeks 

## Features 
- User log in & sign up. 
- Admin users.
- Admin panel.
- Result filtering by price, location and cuisine type.  
- Timestamped commenting system.
- Geolocation.
- Profanity filter.

## Technologies used
- HTML5 / SASS
- BCrypt & sessions
- git / gitHub
- Heroku
- Geocoder
- ActiveAdmin
- Devise
- Simple form
- Fog-AWS
- Carrierwave / mini_magick
- PostgreSQL and SQLite

## App overview
*Logged-out users can*: View all restaurant reviews. 
*Logged-in users can*: Create, edit, bookmark and delete their own reviews. 
*Admin users can*: Access the admin panel where they can create, edit and delete existing reviews and users. They can also modify the content displayed on the static views. 

All reviews are geolocated according to the address that is entered by the user with the help of the geocoder gem. 


## Process


## Challenges


## Wins
Showing different routes for logged-in and Admin users. Although it's relatively simple code once the sessions are set up, it was an exciting breakthrough for my first project: 
```
<% if session[:user_id].present? %>
    <%= link_to "Add a review!", new_review_path %>
<% end %>
```


## Future development

 
