# website-on-rails
Ruby on rails app for my personal website: http://tylorlilley.com
Updated whenever it feels right!

## Adding a new post
To add a new post, simply insert a new post record into the database, providing its title and date. Its slug will be generated automatically.

Make sure the post has most of it under an `- unless intro` section. The only part left out should be whatever you wish to display as the post's intro in the posts index.

```
- heroku run rails c
- Post.create(title: "Your Post Title", date: "YYY-MM-DD") #Create the post on the server
=> #<Post id: 1, title: "Your Post Title", date: "YYY-MM-DD", created_at: "YYYY-MM-DD" HH:MM:SS", updated_at: "YYYY-MM-DD" HH:MM:SS", slug: "YYYY-MM-DD-your-post-title">
```

Add a new view in the app/views/posts directory whose filename matches the generated slug. Add any new images or other assets used in the post to their respective app/assets folder. The file name should match the slug, optionally prepended with -1, -2, -3, etc. if there are multiple assets of that type to be used in the post.

```
- app/assets/YYYY-MM-DD-your-post-title-1.png
- app/assets/YYYY-MM-DD-your-post-title-2.jpg
```

That's all, folks!
