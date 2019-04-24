# ![](/app/assets/images/ga.png) SEI-31 Project 1: NBcrAy

This was developed as part of SEI 31 Project 1, the goal was to build a web application from scratch, with knowledge of front and back-end web development to produce an awesome web application that can be used by friends, family or any of the other billions of people who use the Internet. The type of web application I chose to create was completely up to me.

There were a few prerequisite conditions for the app, they are as follows:

- Models. Your app should have at least 3 models. Make sure they are associated correctly!
- Views. Use partials to DRY (Don’t Repeat Yourself) up your views.
- Handles invalid data. Forms in your application should validate data and handle incorrect inputs. Validate sign up information, verify valid email addresses and secure passwords.
- Use Gems Use a GEM that talks to an API to add functionality to your app.
- User Login. Make sure you have basic authentication and authorisation set up (if you need it).
- Heroku. Deploy your code to Heroku.



You can see the site [here](https://nbaapp.herokuapp.com/).

## Key Point
The codebase was built to minimise repeatable code. 


### NBcrAy
---
#### Home

The home page incorporates the use of the All Sports, Twitter and News API's. It provides an overall general news hub for all things NBA. API calls have been set to a schedule.

---
#### User Login

Users are able to login and select a favourite team of their choosing. Users are able to set and change their password to meet their requirements.

----

#### Team Page

Once users have logged in they are directed to the Team Page. The team page takes advantage of CRUD operations to allow a user to follow certain players and see a plot of those players statistics to compare against each other.

Once on the team page users also have access to their favourite teams entire roster and individual statistics.

The bottom part of the team page is also comprised of a news and twitter feed. News is sorted specific to the team the user has selected. Eg. If a users favourite team is The Boston Celtics, tweets and news for the Celtics will only appear in that users feed.

---

##### Other

All NBA data was scraped using Nokogiri. Team data has been scraped from Wikipedia and individual player data from Basketballreference.com.

## Tools
**Languages:** HTML, CSS, Ruby and Javascript
**Frameworks:** Rails, Bootstrap
**Web Scraping:** Nokogiri
**Server:** Heroku
**Libraries:** jQuery, Chart.js, DataTables.js
**Plugins:** AutoFill
**API's:** Twitter, News, All Sports.
**Gems:** twitter, bootstrap, httparty, ruby-oembed
**Other:** Awesome Fonts