---
tags: ajax, api, todo
languages: javascript 
resources: 7  
---

# AJAX with YouTube 

## Introduction

Visit [this link](https://s3-us-west-2.amazonaws.com/readme-photos/ajax-youtube-example.mov) to watch a video of the functionality we're going for with this todo.

The Ruby app has been built out for you, all you'll need to do is add JavaScript to the `ajaxCall` function in `public/fetch_video.js`. 

There are two routes for you to use, `/`, which renders `views/index.erb`, and `/widget`, which behaves as follows:

* The `/widget` route expects params with a key of `search_keyword` and a value of a string, for instance "sad cat diary", "baby sloth", or "one direction", not that I would search for any of those things...It then returns the HTML to render the first YouTube video for that search.
  * For instance, when the params look like this:

```ruby
{:search_keyword => "true facts about marsupials"}
```

  * The `/widget` route will return this:

```html
<iframe class="" id="ytplayer" type="text/html" width="640" height="390" src="http://www.youtube.com/embed/gNqQL-1gZF8" frameborder="0"></iframe>
```

  * The above string, when rendered as HTML, would look something like this:

![true facts about marsupials](https://s3-us-west-2.amazonaws.com/readme-photos/js-ajax-youtube-todo)

## Instructions

### Overview

Your task is in five parts:

* Run `bundle install`.
* Sign up for a YouTube developer key so that the YouTube class in the `lib/` folder can query the YouTube API with it.

In `fetch_video.js`:

* Retrieve the words that were typed into the text box.
* Make an AJAX call to `/widget` and pass it the typed query.
* Insert the HTML that the AJAX call returns into the page.

Read on for more details!

### Testing Suite

This lab uses [Capybara](https://github.com/jnicklas/capybara) with [Selenium webdriver](http://selenium.googlecode.com/svn/trunk/docs/api/rb/index.html). When you run `rspec`, a browser should pop up and you'll be able to watch the test interact with your app. You'll see it type text into the text box, click buttons, etc.

### Generating a Key

* Before getting started, figure out your public IP address. It's as simple a Googling ["what is my ip address"](https://www.google.com/search?q=what%20is%20my%20ip%20address).
* Make sure you're logged into your Google account, visit [https://console.developers.google.com/project](https://console.developers.google.com/project), and click on "Create Project".
* Name your project something descriptive, like "AJAX with YouTube".
* Select your own unique project ID or go with the pre-generated one.
* Click "Create". This will land you on the project dashboard.
* Click on "Enable an API".
* Find the "YouTube Data API" and toggle the off switch to on.
* On the left-hand side-navigation bar, click on "Credentials".
* Under the "Public API access" section, click on "Create New Key".
* On the modal, click "Server Key".
* Enter your IP address that you found in the first step then click "Create". This will take you to a credential show page.
* Copy the long string of letters that appear to the right of "API KEY".

### Setting Up Your Environmental Variables

* Because keys should be protected (not uploaded to GitHub), you're going to place your key into a file for environmental variables. We'll call it `.env`. You may notice that it's already been added to your `.gitignore` file so that when you add files, it won't get (or should I say git!?!?) included.
* From the root of your cloned repo, make a new file called `.env`. In this file, you'll set the variable DEVELOPER_KEY equal to your copied API key. The file should look something like this:

```
DEVELOPER_KEY=eXamPleAPiKeyStRiNG
```

* The variable must be called DEVELOPER_KEY because it is used on line 8 of `lib/youtube.rb` where `ENV['DEVELOPER_KEY']` appears.
* Environmental variables can be accessed by calling ENV['NAME_OF_VARIABLE']. This functionality has been built out for you by the [dotenv gem](https://github.com/bkeepers/dotenv).

### Get User Input

* Open up the `fetch_video.js` file in the `public` folder. In the first line of the `ajaxCall` function, make a variable called `input` and set it equal to the text in the input box with the ID of `text-field`. 
* If you need help, here's an example of making a variable called `nameOfUser` that is equal to the value of a text box with a class of "user-name":

```javascript

var nameOfUser = $(".user-name").val();

```

### Make an AJAX Call

* Make an an AJAX GET call to the route `/widget` to retrieve a YouTube widget based on the user's input. Remember, if the user types "giraffes", the params you pass it should look like this:

```ruby
{search_keyword: "giraffes"}
```

### Example AJAX Call

* Here's an example of an AJAX POST to `/users`.

```javascript

var nameOfUser = $(".user-name").val();
var userType = "admin";

$.ajax({
  type: "POST",
  url: "/users",
  data: {user_name: nameOfUser, user_type: userType}
})
  .done(function(messageFromController) {
    console.log(messageFromController);
  });
```

* Once the call hits the controller, the params would look like this:

```ruby
{:user_name => "Stephanie", :user_type => "admin"}
```

### Adding the YouTube Widget to the Page

* Add widget that was returned from the controller to the div with the id of `search-results`. Here's an example of JavaScript that would replace the contents of anything with the class `super-classy` with the paragraph "hello world":

```javascript
$(".super-classy").html("<p>hello world</p>");
```

## Resources

* Background Documentation
  * [GitHub](https://github.com/) - [YouTubeIt Gem](https://github.com/kylejginavan/youtube_it)
  * [GitHub](https://github.com/) - [Dotenv Gem](https://github.com/bkeepers/dotenv)
  * [GitHub](https://github.com/) - [Capybara](https://github.com/jnicklas/capybara)
  * [Selenium Webdriver](http://selenium.googlecode.com/svn/trunk/docs/api/rb/index.html)

* jQuery Help
  * [jQuery Docs](http://api.jquery.com/) - [Val Function](http://api.jquery.com/val/)
  * [jQuery Docs](http://api.jquery.com/) - [AJAX Call](http://api.jquery.com/jquery.ajax/)
  * [jQuery Docs](http://api.jquery.com/) - [HTML Function](http://api.jquery.com/html/)
