Obtvse
================
A clean and simple markdown blog.  Inspired by [Svbtle](http://svbtle.com).

**[My Blog URL](http://sidsaquarius.in)**



Installation
============

If you are new to Rails development, check out guides for getting your development environment set up for [Mac](http://astonj.com/tech/setting-up-a-ruby-dev-enviroment-on-lion/) and [Windows](http://jelaniharris.com/2011/installing-ruby-on-rails-3-in-windows/).

    $ git clone git://github.com/NateW/obtvse.git
    $ cd obtvse
    $ bundle install
    $ rake db:migrate

Edit `config/config.yml` to set up your site information.  To set up your admin username and password you will need to set your environment variables.

Start the local server:

    $ rails s

Go to [0.0.0.0:3000](http://0.0.0.0:3000/), to administrate you go to [/admin](http://0.0.0.0:3000/admin)



Deploying on Heroku
===================

Install the [Heroku Toolbelt](https://toolbelt.herokuapp.com/) on your local workstation. This ensures that you have access to the Heroku command-line client, Foreman, and the Git revision control system.

Now, create the app on Cedar stack

    $ heroku create --stack cedar

Edit `config/config.yml` to set up your site information.  To set up your admin username and password you will need to set your environment variables. 

    $ heroku config:add obtvse_login=<LOGIN> obtvse_password=<PASSWORD>

Or in your shell (~/.bashrc or ~/.zshrc for example)

    $ export obtvse_login=<LOGIN>
    $ export obtvse_passowrd=<PASSWORD>

Deploy your changes to heroku.

    $ git add .
    $ git commit -m "deploy obtvse blog on Heroku"
    $ git push heroku

After that, run rake.

    $ heroku run rake db:migrate

Check `ps` to see the state of app's processes:

    $ heroku ps




Open the app
=======

    $ heroku open

Here's a quick [guide for installing on Heroku](http://natewienert.com/installing-obtvse-on-heroku).



TODO
====
- 



SCREENSHOTS
===========
![Admin](http://i.imgur.com/OVr7q.png)
![New](http://i.imgur.com/MTm2c.png)
![Edit](http://i.imgur.com/VSR7M.png)
