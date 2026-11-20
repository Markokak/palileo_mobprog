# Mark Aeron R. Palileo
# 2024-1002703
# INF 241

Laboratory 1: Discussion -
The newsfeed card was made reusable by adding optional image paths for the user’s profile picture and post image. Each card receives its own paths from newsfeed_screen.dart, so Mark’s card can show markprofile.jpg and markpost.png, while Leni’s card shows leni.jpg and otw.jpg. Since these are local project files, Image.asset is 
used instead of Image.network. The post image is displayed only when an image path is provided; otherwise, the widget returns SizedBox.shrink(), so the card layout works with or without a post image. A fallback with the user’s initials is shown when no profile image is provided or it fails to load.
