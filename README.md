# [TamaGAtchi](https://blooming-stream-6851.herokuapp.com/)

<img src="app/assets/screenshot.png">
[TamaGAtchi](https://trello.com/b/KgZCbZaI/wdi-project-2)

##Description
It's part entertainment and part message board.  Performing regular message board functions such
as posting and having your posts upvoted by others will level up your TamaGAtchi.  Eventuall you'll be able to battle other TamaGAtchis, and have new ways to level up as more features are added to the message board.

##Installation/Getting Started
No installation is required  Simply browse to the [TamaGAtchi website]
(https://blooming-stream-6851.herokuapp.com/)
to use.  You will be required to set up a free account on the site to use it.

##Technical Specs

This game is built using the following technologies

-HTML, CSS, and Bootstrap for the GUI
-Javascript and jQuery for some interaction between the GUI and Ruby
-Ruby and Rails for the routing and data logic
-ActiveRecord and Postgresql for the database interaction

### [User Stories, ERD, and Wireframing](https://trello.com/b/KgZCbZaI/wdi-project-2)

## Outstanding Issues
- passing parameters or data to modal for the purpose of viewing or editing a post
- tamagatchi_path in link_to reset in index.html.erb
- cleaning up some routes which are short-cutted
- (modal) notification when user levels up
- bootstrap version conflicts
- some error/status messages need to be cleared out after being displayed
- code needs some serious refactoring
- partial information is not saved (e.g. name, possibly email) when an invalid signup request occurs
- some empty views need to be cleaned out

## Next Steps
- improved integration between message board and TamaGAtchi leveling, including adding new features to provide additional ways to level up.
- better status messages
- password reset function
