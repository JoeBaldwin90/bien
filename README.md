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
I started by designing a hypothetical client proposal and started to think about the code that I'd need for each feature, what data I needed in my models and how they related to each other. 

Then I generated my review model, controller and set up the resources needed for my review routes. I made the index view for the reviews my root view. I then wrote the CRUD code in my reviews controller and added some validations to my form parameters. 

Since restaurant reviews are likely to be shared I added some SEO friendly URLs and custom page titles. 

Next I added geolocation for the reviews which required me to add an address, latitude and longitude column to my review model. 

Review filters came next so users can search by price, cuisine and location. 

Once I was happy with my reviews I generated a comments model, which belongs to the review model. As such, the resources for the comments were nested in the review resources. 

Once the user and comments were set up I had to think about my users. I installed the Bcrypt gem to secure my users passwords. I then set up sessions for users when they login and built a user profile view. 

## Challenges
Understanding the relationships between my users, reviews, comments and bookmarks was probably the most difficult thing about this project. On paper the relationships seem simple, but I had trouble translating this into code

## Wins
Showing different routes for logged-in and Admin users. Although it's relatively simple code once the sessions are set up, it was an exciting breakthrough for my first project: 
```
<% if session[:user_id].present? %>
    <%= link_to "Add a review!", new_review_path %>
<% end %>
```


## Future development
Much better styling. I'm planning to resett all of my CSS and build this app for mobile-first using bootstrap.  
 
