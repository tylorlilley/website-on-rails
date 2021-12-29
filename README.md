# website-on-rails
Ruby on rails app for my personal website: http://tylorlilley.com

# Updating with a post
To add a new post, simply insert a new post record into the database, providing its title and date. Its slug will be generated automatically.

Add a new view in the app/views/posts directory whose filename matches the generated slug. Add any new images or other assets used in the post to their respective app/assets folder. The file name should match the slug, optionally prepended with -1, -2, -3, etc. if there are multiple assets of that type to be used in the post.
