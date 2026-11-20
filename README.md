# Mark Aeron R. Palileo
# 2024-1002703
# INF 241

Laboratory 0: Discussion -
Setting up my Flutter development environment involved several challenges, particularly configuring the Android SDK, Command-line Tools, and launching the Android Emulator.
One issue I encountered was an inconsistent SDK package location warning because I had two Command-line Tools folders with different versions (22.0 and 23.0). I also experienced emulator problems, such as black screens, automatic shutdowns, and ADB showing the device as offline or unresponsive.

To troubleshoot these issues, I used commands such as flutter doctor -v, adb devices -l, emulator -list-avds, and sdkmanager --list_installed. I also checked Windows Event Viewer and experimented with different emulator launch settings to identify possible causes.

Through this experience, I learned that Flutter depends on properly configured development tools, including the Android SDK, JDK, and emulator. In future projects, I will verify system requirements, keep SDK installations organized, check dependencies using flutter doctor, and test emulators early to avoid configuration problems.

Laboratory 1: Discussion -
The newsfeed card was made reusable by adding optional image paths for the user’s profile picture and post image. Each card receives its own paths from newsfeed_screen.dart, so Mark’s card can show markprofile.jpg and markpost.png, while Leni’s card shows leni.jpg and otw.jpg. Since these are local project files, Image.asset is 
used instead of Image.network. The post image is displayed only when an image path is provided; otherwise, the widget returns SizedBox.shrink(), so the card layout works with or without a post image. A fallback with the user’s initials is shown when no profile image is provided or it fails to load.
