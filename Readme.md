Kevin Bot
========

A bot for the Bills
---------

**Dependancies**

Kevin Bot runs on [lita](https://github.com/jimmycuadra/lita) which reqires

* [Ruby 2.x](http://www.ruby-lang.org/)
* [Redis](http://redis.io/)

**Instalation**

To install Kevin Bot:

    cd path/to/kevinbot/
    bundle

You'll also need redis if you want to test locally:

    brew install redis

**Testing Kevin Bot locally**

To test our fearless chatbot locally, you need to start a redis server

    redis-server

Then, start up the bot

    cd path/to/kevinbot/
    lita

And the bot should run and connect to hipchat!

**Note:** The bot is tied to a hipchat account and therefore only can be run at once place at any given time. Please do not run the bot if it is already connected to a live server.