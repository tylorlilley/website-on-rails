# website-on-rails
Ruby on rails app for my personal website: http://tylorlilley.com
Updated whenever it feels right!

## Adding a new post
To add a new post, simply insert a new post record into the database, providing its title and date. Its slug will be generated automatically.

Make sure the post has most of it under an `- unless intro` section. The only part left out should be whatever you wish to display as the post's intro in the posts index.

```
- heroku run rails c
- Post.create(title: "Your Post Title", date: "YYYY-MM-DD") #Create the post on the server
=> #<Post id: 1, title: "Your Post Title", date: "YYYY-MM-DD", created_at: "YYYY-MM-DD" HH:MM:SS", updated_at: "YYYY-MM-DD" HH:MM:SS", slug: "YYYY-MM-DD-your-post-title">
```

Add a new view in the app/views/posts directory whose filename matches the generated slug. Add any new images or other assets used in the post to their respective app/assets folder. The file name should match the slug, optionally prepended with -1, -2, -3, etc. if there are multiple assets of that type to be used in the post.

```
- app/assets/images/posts/YYYY-MM-DD-your-post-title-1.png
- app/assets/images/posts/YYYY-MM-DD-your-post-title-2.jpg
```

## Adding a new game
To add a new game, insert a new game record into the database by providing the following information. Its slug will be generated automatically.

```
- heroku run rails c
- Game.create(name: "Your Game Name", date: "YYYY-MM-DD", tagline: "Some game tagline", filename: "filename", image_height: 240, image_width: 400, mac_version: false, itch: true) #Create the game on the server
=> #<Post id: 1, title: "Your Post Title", date: "YYYY-MM-DD", created_at: "YYYY-MM-DD" HH:MM:SS", updated_at: "YYYY-MM-DD" HH:MM:SS", slug: "YYYY-MM-DD-your-post-title">
```

Add a new view in the app/views/games directory whose filename matches the give filename for the game. 

You must also add four images for this game to the /app/assets/images/games/ folder, whose filenames match the game filename + underscore + (1-4). The first image (ex: filename_1.png) will be the game's main image that's displayed at the top of the game page as well as the image used on the games index page.

```
- app/assets/images/games/filename_1.png
- app/assets/images/games/filename_2.png
- app/assets/images/games/filename_3.png
- app/assets/images/games/filename_4.png
```

The tagline provided will be displayed as the caption for the main image on both the game page and the games index page.

The image_width and image_height are optional but providing them lets the code that displays the game images know what size to display them at, so it's good to provide it anyway. The provided width and height should be integers (not strings) that match the width and height of the provided screenshots (in pixels).

If the optional mac_version flag is given as true, a seperate download link pointing to a mac version of the game will also be generated

If the optional itch flag is given as true, the download links point to the itch.io address corresponding to the game's filename instead of to the typical download server.

```
- https://tylorlilley.itch.io/filename
```

If the optional itch flag is not given as true, a zip file formated as "tylorlilley_" + game filename + ".zip" should be uploaded to the Amazon S3 bucket that contains these games and the generated download link will point to it automatically. For a mac version to be available, also upload a zip file formatted as "tylorlilley_" + game filename + "_mac.zip" to that same location

```
- tylorlilley_filename.zip
- tylorlilley_filename_mac.zip
```

## Conclusion
That's all, folks!


Post.create(title: "Thy Dungeonman 1 & 2 for Playdate", date: "2023-07-16") #Create the post on the server
Game.create(name: "Thy Dungeonman 1 & 2 for Playdate", date: "2023-07-16"), tagline: "Re-experience these 2004 classics on a funky new handheld device!", filename: "thy-dungeonman-for-playdate", image_height: 240, image_width: 400, mac_version: false, itch: true) #Create the game on the server
