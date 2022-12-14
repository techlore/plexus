# Plexus
***Remove the fear of Android app compatibility on de-Googled devices.***

[![CI](https://github.com/techlore/plexus/actions/workflows/ci.yaml/badge.svg)](https://github.com/techlore/plexus/actions/workflows/ci.yaml)

## Important updates as of May 12, 2022
Hey everyone, thanks for visiting the repo & thank you to all contributors. Plexus is going through a massive transition right now:
* [The Plexus application has been released](https://github.com/techlore/Plexus-app)
* [The Plexus data in that repo is now in JSON format](https://github.com/techlore/Plexus-app/blob/main/Plexus.json) meaning we now have two different datasets, at least temporarily.
* The JSON format is already better than the terrible CSV format in this repo, but the JSON format is actually temporary. We are working on an API to avoid the entire GitHub submission workflow.
* Because so many changes are happening at once, we will not be accepting pull requests until our new workflow is completed. Once it's completed, we will be manually porting over your submissions to the new data and closing the PRs.
* Once everything is completed, all submissions will only be done via the application. We don't have an estimate yet, but it'll be the best ever experience once this is completed, enabling anyone to easily submit apps in an automated fashion in bulk.


## Explanation

Google Play Services are an integral part of most Android devices that enable users to utilize their Google account on their phone, as well as enable Google-specific features for applications that rely on them.

When users move to a de-googled ROM like GrapheneOS, CalyxOS or LineageOS, they are faced with opening their standard applications hoping they work. Plexus aims to beat the guessing game and allow users to know exactly what will happen once they flash a new ROM. Plexus supports ROMs with no Google Play Services e.g: [(GrapheneOS)](https://grapheneos.org/), as well as ROMs with [microG](https://microg.org/), an open source alternative of Google Play Services, e.g: [(CalyxOS)](https://calyxos.org/).

## Navigating Plexus

* To view app data, visit the [Plexus Website](https://plexus.techlore.tech/)

* To view the CSV spreadsheet (and contribute) view it [here](./src/data/Plexus.csv).

* To create or view app requests where other testers can contribute and volunteer to test for you, [go here](./src/data/requests.csv)

* To join our Matrix room, [go here.](https://matrix.to/#/#plexus:matrix.org)

**NOTE: Plexus is only for applications directly or indirectly from the Google Play Store. Please do not submit applications from F-Droid as they are all expected to work.**

## What Do The Ratings Mean?

1. Unusable. Mostly apps that fail to open
2. Acceptable but with missing or broken functionality
3. Almost everything works with minimal caveats
4. Perfect or like-perfect experience

## How To Contribute Your Applications

### Testing Standards

- Test only Google Play Store applications (Regardless of where they came from, including the Aurora Store)
- Kindly disable Netguard and other blockers
- No Google Play Services
- Pay extra attention to notifications as some will not properly work. If you're testing on MicroG, it is assumed you have enabled GCM/FCM. If you have not enabled GCM/FCM, you are still free to report applications, but please exclude any information regarding missing notifications. (Notifications working is okay and encouraged even with GCM/FCM disabled.)
- If you're testing from MicroG, only input data in the last two columns, and utilize two "X"s for the standard sections.
- If you're testing from a fully de-googled ROM without MicroG, input data in the standard sections and mark the MicroG sections as "X"s

### Contribute Method 1 (Recommended)

Edit the file [Plexus.csv](https://github.com/techlore/plexus/blob/App-Requests/src/data/Plexus.csv) and start a pull request with your apps to submit. Ensure you're maintaining the proper CSV format in alphabetical order to make merging as simple as possible.

1. App Name
2. Month Last Tested
3. Year Last Tested
4. App score. Please refer to the rating section of the readme to help figure out what score a service is. We may change your score if it doesn't match our rating method. Label "X" if you're testing with MicroG.
5. Any issues with the application. Explain your problems, or just say "No reported issues" if the app works perfectly. Label "X" if you're testing with MicroG.
6. MicroG App Score. This is ONLY for users testing apps on MicroG. Please refer to the rating section of the readme to help figure out what score a service is. We may change your score if it doesn't match our rating method. Label "X" if you're not testing with MicroG.
7. MicroG issues. Explain your problems, or just say "No reported issues" if the app works perfectly. Label "X" if you're not testing with MicroG.

### Contribute Method 2 (Non-Github Method)

Email support@techlore.tech with all your apps you use on your phone that are from the Google Play Store (Directly or Indirectly) with the following information:

1. App Name
2. Month Last Tested
3. Year Last Tested
4. App Score. Label "X" if you're testing with MicroG.
5. Any issues with the application. Explain your problems, or just say none if the app works perfectly. Label "X" if you're testing with MicroG.
6. MicroG App Score. Label "X" if you're not testing with MicroG.
7. MicroG issues. Label "X" if you're not testing with MicroG.

I will then update the spreadsheet myself.

## Application Requests

If you're unable to find an application within Plexus and don't have the means of testing them yourself, you can submit an App Request where other testers can test apps on your behalf. This is purely on a volunteer basis. There will be methods of incentivizing volunteers down the road.

To submit an application request, do one of the following:
1. Submit a PR with your app(s) [in the repo.](./src/data/requests.csv)
2. Email support@techlore.tech with the following information: Name/Alias, App Name(s),MicroG (Yes/No), Urgent (Yes/No)

## Future Plans & Goals
- Support for "recommended alternatives" similar to alternativeto.net
- More thorough data showing what OS & ROM was used for testing

## License
Except where indicated otherwise, this project is licensed under the terms of [GPLv3](https://www.gnu.org/licenses/gpl-3.0.html)
