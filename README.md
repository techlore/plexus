# Plexus

A common concern expressed by users wanting to move to a de-googled Android ROM is: *Will my apps work without Google Play Services?*

Plexus crowdsources data from custom Android ROM users to display what apps do/don't work without Google Play Services. 

## Explanation
Google Play Services are an integral part of most Android devices that enable users to utilize their Google account on their phone, as well as enable Google-specific features for applications that rely on them. 

When users move to a de-googled ROM like GrapheneOS or LineageOS, they are faced with opening their standard applications hoping they  work. Plexus aims to beat the guessing game and allow users to know exactly what will happen once they flash a new ROM. 

## Navigating Plexus
Currently, Plexus is just a standard CSV spreadsheet in this repo. You'll find it in the main directory. You can search for the app you are interested in with the find function in your web browser. 

## What Do The Ratings Mean?
1. Unusable. Mostly apps that fail to open
2. Acceptable but with missing or broken functionality
3. Almost everything works with minimal caveats 
4. Perfect or like-perfect experience

## How To Add Your Applications & Contribute
This is quickly thrown together so we can start collecting data. It's by no means perfect, and I am aware not everyone uses Github. 

### Method 1 (Recommended)
Start a pull request with your apps to submit. Ensure you're maintaining the proper CSV format in alphabetical order to make merging as simple as possible. 

### Method 2 (Non-Github Method)
Email me at support@techlore.tech with all your apps you use on your phone that are from the Google Play Store (Directly or Indirectly) with the following information:
1. App Name
2. Month Last Tested
3. Year Last Tested
4. Any issues with the application. Explain your problems, or just say none if the app works perfectly. 

I will then update the spreadsheet myself. 

## Future Plans & Goals
* A website will need to happen at some point in order to allow a better format and expandability of listing data. 
* Having support for "recommended alternatives" will one day happen once we have a more centralized method of accessing information, perhaps in the form of a website and/or mobile app
* Eventually, this should be an app you can download from F-Droid, and it'll conveniently scan and let you report all apps from your phone. Automating most of the process and putting Plexus in a single place. 
