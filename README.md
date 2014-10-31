---
tags: ajax, api, todo
languages: javascript 
resources: 2
---

# AJAX with YouTube 

Visit [this link](https://s3-us-west-2.amazonaws.com/readme-photos/ajax-youtube-example.mov) to watch a video of the functionality we're going for with this todo.

## Instructions

### Generate a Key

* Before getting started, figure out your public IP address. It's as simple a Googling "what is my ip address".
* Make sure you're logged into your Google account and visit [https://console.developers.google.com/project](https://console.developers.google.com/project) and click on "Create Project".
* Name your project something descriptive, like "AJAX with YouTube".
* Select your own unique project ID or go with the pre-generated one.
* Click "Create" which will land you on the project dashboard.
* Click on "Enable an API"
* Find the "YouTube Data API" and toggle the off switch to on.
* On the left-hand side-navigation bar, click on "Credentials"
* Under the "Public API access" section, click on "Create New Key"
* On the modal, click "Server Key"
* Enter your IP address that you found in the first step then click "Create". This will take you to a credential show page.
* Copy the long string of letters that appear to the right of "API KEY"

### Environmental Variable Time

* Because keys should be protected (not uploaded to GitHub), you're going to place your key into a file for environmental variables. We'll call it `.env`. You may notice that it's already been added to your `.gitignore` file so that when you add files, it won't get included.
* From the root of this repo you cloned, make a new file called `.env`. In this file, you'll set the variable DEVELOPER_KEY equal to your copied API key. The variable must be called DEVELOPER_KEY because it is called on on line 6 of `lib/youtube.rb`. 
* Environmental variables can be accessed by calling ENV['NAME_OF_VARIABLE']. This functionality has been built out for you by the [dotenv gem](https://github.com/bkeepers/dotenv).

`.env`
```
DEVELOPER_KEY=eXamPleAPiKeyStRiNG
```

### Get User Input

Open up the `fetch_video.js` file in the `public` folder. In the first line of the `ajaxCall` function, make a variable called `input` and set it equal to the text in the input box with the ID of `text-field`. 

* If you need help, here's an example of making a variable called `nameOfUser` that is equal to the value of a text box with a class of "user-name":

```javascript

var nameOfUser = $(".user-name").val();

```

### Make an AJAX Call

Make an an AJAX GET call to the route "/widget" to retrieve a YouTube widget based on the user's input. If the user types "giraffes", the params you pass it should look like this:

```ruby
{ :search_keyword => "giraffes" }
```

### Example AJAX Call

Here's an example of an AJAX POST to `/users`.

```javascript

var nameOfUser = $(".user-name").val();
var userType = "admin";

$.ajax({
  type: "POST",
  url: "/users",
  data: { user_name: nameOfUser, user_type: userType }
})
  .done(function( messageFromController ) {
    console.log("messageFromController");
  });
```

* Once the call hits the controller, the params would look like this:

```ruby
{:user_name => "Stephanie", :user_type => "admin"}
```

### Adding the YouTube Widget to the Page

Add widget that was returned from the controller to the div with the id of `search-results`. Here's an example of JavaScript that would add a paragraph with the words "hello world" to a div with the class "super-classy":

```javascript
$(".super-classy").html(<p>hello world</p>);
```

Be sure that if someone searches for "giraffes", then for "stapler", they only see one video at the end, of the video that was a hit for staplers. In other words, make sure you're clearing the `#search-results` before you add a video.

## Resources
* []() - []()
* []() - []()
* []() - []()
