Riverside iOS Project README


Clients
Veni Linos -- vlinos@hse.k12.in.us
Speech Language Pathologist
Ammie Terlecky -- aimee.short@gmail.com
Occupational Therapist




REQUEST: 
create an iPad application to help students with Autism learn to recognize and express emotions more clearly, as well as be able to handle their own emotions.


Required Hardware


* iMac / Macbook with Mac OS catalina
* iPad/iPhone with minimum iOS 13.7
IMPORTANT: An Apple Device (iMac, Macbook) is required to code on this project. There are options for iOS development on butler campus. 
* Most computer labs will have a couple macs available for development. 
* You can also rent macs from butler library 
   * https://butleru.force.com/askbutler/s/article/How-can-I-get-a-loaner-laptop
* Dr. Linos may be able to help you work with IT for a more long term borrowing solution. Be sure to ask him!


IF YOU CAN’T GET ACCESS TO A MAC AND WANT TO CODE, THIS PROJECT MAY NOT BE FOR YOU!




Figma Instructions
* No downloads are needed to start working on Figma. Contact me to be added to the current wireframe: wvesevic@butler.edu
* Everyone can work collaboratively at anytime as well all you have to do is share it with your group
* Most of what I learned was through trial and error accompanied by a few youtube tutorial videos (I suggest watching youtube videos when you get stuck)
   * View current wireframe Riverside app – Figma 




Figma Tutorials
* iOS Design Kit: How to use in Figma - YouTube
* How to Wireframe with Figma: Wireframing 101 - Bing video
Apple UI kit
   * iOS/iPadOS 13 Design UI Kit (Community) – Figma


Contact me with additional questions I will help with what I can wvesevic@butler.edu 


XCODE


If you have any questions about how to access the repository, files, or running XCode, feel free to contact me at nicoleleeselig@gmail.com. I would also be more than happy to walk you through the Xcode interface and some of the code via Zoom!


Where to find the Project Repository (Last Updated 12/3/2020)


https://github.com/NicoleSelig/AutismTherapyAppIOS


How to Fork A Repo: https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/fork-a-repo


XCode Start Up
* Everyone developing on XCode must have an apple ID. Sign up for one here. 
        
* If you do not have XCode installed on your computer, you can download it here. 


How to Run the Project
1. From your repository folder, click on RiversideIOS.xcodeproj


  



2. You will need to add your Apple ID in order to run this on a device. In the top left corner of XCode, click on RiversideIOS  


   3. In the middle pane, click on ‘Signing & Capabilities’
  



   4. Where it says ‘Team’, add your Apple ID. You will also have to create a new Bundle Identifier (write whatever makes sense)
  



   5. Download the Machine Learning model used for the photobooth activity. You can download it here. Move the file into ‘Supporting Files’ in the XCode project
  



   6. You can run/debug this program two ways: through an actual device or a simulator. To run in a simulator, select what device you want and hit the play button. The first run will take a lot longer, as you are essentially downloading that device to your mac.   


      7. Running the program on an actual device is recommended, as simulators can slow your mac down significantly. You also need a device to program with any of the peripherals (camera, microphone). To run on your device, plug it into your mac via USB/lightning cable. Choose your device, and hit the play button. The app will install on your device and run. Once you install the device, it will be a permanent app that you can run anywhere without XCode.


  
  



XCode/Swift Tutorials
      * iOS development Udemy Course -- More than worth the 13 bucks! Videos cover everything you need to know about XCode, Swift, and it even has some Machine Learning, AR, and database integration videos. Buy once and own forever. Share an account and use it together!
      * https://www.appcoda.com/arkit-face-tracking/
      * 5491-ar-face-tracking-tutorial-for-ios-getting-started
      * https://www.appcoda.com/create-ml/
      * https://www.appcoda.com/core-ml-tools-conversion/
      * https://awesomerank.github.io/lists/likedan/Awesome-CoreML-Models.html






How To Live Demo The App


You can share your device’s screen as long as your device is plugged into your computer with a USB/lightning cable. 


If you are using Zoom, I highly recommend demonstrating with your device instead of a simulator, as using both Zoom and the Simulator can cause significant slowdowns or problems. Also, you won’t be able to demo with your devices’s camera or microphone on the simulator. 


For Mac:


      1. Once your device is plugged in, open up QuickTime Player
  



      2. At the top left corner of your screen, select ‘file’ then ‘New Movie Recording’
  

        
      3. You will likely see your FaceTime HD Camera pop up. Click on5dc the arrow next to the Record button, and select your device.
  
        


      4. You should be able to see your device screen. You will be able to share this screen on zoom or in the classroom and use your phone for live demos. You will also be able to make recordings of your demos to send to the client. 


For Windows:


Windows machines will need a companion app installed on both your device, and your computer. LetsView is free to download.


      1. Once you have this app set up on both devices, plug in your phone, run the app on your computer
      2. On your phone or iPad, swipe up/down to get to your control menu 
      3. From there you’ll enter the screen sharing menu, where you can select Let’s View.
   
      4. You should be able to see your device screen. You will be able to share this screen on zoom or in the classroom and use your phone for live demos. 
      5. You can also record your screen from the control panel of your device as well, without screen mirroring, just click on the record button in the bottom left corner, shown above




Suggested Improvements/Implementations


Figma: 


      * Discover a better color theme and research which colors are most appropriate for this kind of project
      * Suggestions from clients “Less visual stimuli behind the pictures. Currently there is a red curtain, maybe just a soft solid color behind it so the students can focus on just the picture.
      * -I really like the emotion "quiz" where they identify from the picture. I would love for there to be an auditory and visual reaction when they make a choice. 


      * Clean up and simplify as much as you can the more basic it is the better
      * Design the different meditation themes 
      * The meditation button in the middle should be expanding and contracting to represent exhaling and inhaling
      * We wanted the different themes to have different animations that are pleasing to the eye and addicting to the student to keep them hooked. (The client told us one of their students enjoys watching youtube videos of washing machines for hours so if they could be meditating while doing this it would be key)
      * Add multiple new emotions to both quizzes along with varies new pictures
      * Variety in which questions are asked each time you take the quiz
      * Look into the animation tools figma has to allow the app to transition nicely while you’re presenting
      * Look deeper into the design tools Figma has to perfect the display of the app and make it look professional
      * The client would like a way to view students progress so you can work with them on making a companion app for the teachers


XCode/Swift:
      * The User Interface needs done. UI on XCode is its own beast…have one person dedicated to this only!
      * The client says there needs to be as little choices as possible and most of the activities need to have ‘one-directional flow’. Avoid back buttons or menu buttons where you think students will need the most focus (breathing app, in the middle of a quiz, etc)
      * Clients requested that the Quiz display only 2 possible answers for the first half of the game, then move to 4 possible answers after the player hits 500 points. 
      * Have the breathing activity ask the user how they are feeling before and after the breathing session. Cap the breathing app to run for 1 minute. 
      * The Photobooth app is only accurate about 30% of the time, but there are options to explore:
      * Using ARKit for finding point values of the face instead
      * Use a Different ML model.. Here are some emotion themed suggestions
      * Emotions in classical music
      * Emotions in speech. 


Other:
      * The clients want some sort of special access with student data. This can be done with a separate log in or tab, but a separate app would work really well for this! (Think Canvas Student and Canvas Teacher)
      * More royalty free pictures in a database for the quiz game
      * Database to store information about a student
      * Database to store scores for activities
      * Database Log date/time for use of the breathing app, also log emotions before and after.