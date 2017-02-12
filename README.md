# MineSweeper game

Made of two parts, a backend API and a JS web client

The game logic is implemented all in the backend to make the API more interesting.
This is unrealistic for a simple game as Minesweeper and makes it unresponsive as we have to talk with the server and receives state change.
Save & restore is trivial because of latest state is always on server.
Also this makes the game more secure, because there is no JS client code and local state to hack.

## App setup

* Requirement: Ruby >= 2.3.1, Rails 5.01, Heroku account

* Database creation

rake db:migrate

* How to run the test suite

rake test

* Deployment instructions

Usual git push to Heroku repo

## Models

* User
* Game
* Board

## Endpoints (hopefully Rest-full)

* POST /api/v1/guess/:id/step_on                api/v1/guess#step_on

* POST /api/v1/guess/:id/flag                   api/v1/guess#flag

* POST /api/v1/guess/:id/add_question           api/v1/guess#add_question

* PUT  /api/v1/guess/:id/freeze                 api/v1/guess#freeze

* PUT  /api/v1/guess/:id/restore                api/v1/guess#restore

* POST /api/v1/guess                            api/v1/guess#create

* POST /api/v1/guess/:id/games/new              api/v1/games#create
    Params: width, height, num_mines

* POST /api/v1/users/:id/games/:id/step_on      api/v1/games#step_on
    Params: x, y

* POST /api/v1/users/:id/games/:id/flag         api/v1/games#flag
    Params: x, y

* POST /api/v1/users/:id/games/:id/add_question api/v1/games#add_question
    Params: x, y

* PUT  /api/v1/users/:id/games/:id/freeze       api/v1/games#freeze

* PUT  /api/v1/users/:id/games/:id/restore      api/v1/games#restore

* GET  /api/v1/users/:id/games                  api/v1/games#index

* POST /api/v1/users/:id/games/new              api/v1/games#create
    Params: width, height, num_mines

* GET  /api/v1/users                            api/v1/users#index

* POST /api/v1/users                            api/v1/users#create
    Params: email, pwd
