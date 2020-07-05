# Plexus
<img src="https://techlore.tech/plexus.png" width="200" height="200">

A common concern expressed by users wanting to move to a de-googled Android ROM is: *Will my apps work without Google Play Services?*

Plexus crowdsources data from custom Android ROM users to display what apps do/don't work without Google Play Services. 

## Explanation
Google Play Services are an integral part of most Android devices that enable users to utilize their Google account on their phone, as well as enable Google-specific features for applications that rely on them. 

When users move to a de-googled ROM like GrapheneOS or LineageOS, they are faced with opening their standard applications hoping they work. Plexus aims to beat the guessing game and allow users to know exactly what will happen once they flash a new ROM. 

## Navigating Plexus
Currently, Plexus is just a standard CSV spreadsheet in this repo. You can search for the app you are interested in with the find function in your web browser. 

**NOTE: Plexus is only for applications directly or indirectly from the Google Play Store. Please do not submit applications from F-Droid as they are all expected to work.**

## What Do The Ratings Mean?
1. Unusable. Mostly apps that fail to open
2. Acceptable but with missing or broken functionality
3. Almost everything works with minimal caveats 
4. Perfect or like-perfect experience

## How To Add Your Applications & Contribute
This is quickly thrown together so we can start collecting data. It's by no means perfect, and I am aware not everyone uses Github. 

### Testing Standards

* Test only Google Play Store applications (Regardless of where they came from)
* Kindly disable netguard and other blockers
* No Google Play Services or alternatives 
* Pay extra attention to notifications as most will not work and this should be reported in the spreadsheet

### Contribute Method 1 (Recommended)
Start a pull request with your apps to submit. Ensure you're maintaining the proper CSV format in alphabetical order to make merging as simple as possible. 
1. App Name
2. Month Last Tested
3. Year Last Tested
4. Any issues with the application. Explain your problems, or just say "No reported issues" if the app works perfectly.

### Contribute Method 2 (Non-Github Method)
Email me at support@techlore.tech with all your apps you use on your phone that are from the Google Play Store (Directly or Indirectly) with the following information:
1. App Name
2. Month Last Tested
3. Year Last Tested
4. Any issues with the application. Explain your problems, or just say none if the app works perfectly. 

I will then update the spreadsheet myself. 

## Future Plans & Goals
* Support for application version numbers.
* Support for MicroG compatablity scoring.
* A website to allow better formatting of application data. 
* Support for "recommended alternatives" similar to alternativeto.net
* An app you can download from F-Droid that conveniently scans app on your phone allowing you to submit scores within a centralized location.

![](https://i.creativecommons.org/p/zero/1.0/88x31.png) This project is licensed under the terms of the CC0 V1 License. 
