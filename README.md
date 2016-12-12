# Pre-work - Tipper

Tipper is a tip calculator application for iOS.

Submitted by: Daniel Ku

Time spent: 1.5 hours spent in total for the app
            2 hours spent trying to implement a different feature but ended up not being possible due to Swift3 change prohibiting a certain framework.

## User Stories

The following **required** functionality is complete:
* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [X] Settings page to change the default tip percentage.
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

* [X] Added a split feature for people needing to split the check.
* [X] Added an option in the settings page to choose the type of tip style to use.
* [X] Added a rounding option for users to round the total amount to get a clean total.
* [X] After calculation there is the final amount, the tip amount, and the price per person.
* [X] I wanted users to be able to input different things therefore I added a keyboard disapear functionality.
* [X] Brought in an icon for the settings button since it's better UI in my opinion.


## Video Walkthrough 

Here's a walkthrough of implemented user stories:

[Tipper Video Walkthrough](https://cloud.githubusercontent.com/assets/15112554/21096081/314c7c40-c013-11e6-88af-678e799fd61c.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I've already created a tip calculator as my very first app when I first got into iOS Dev. I created one fresh in order to think of new ways since the first version was a very basic one. I decided to add a split and settings option for the user. I also wanted to add a history using a tableview and Realm but there seems to be a lot of problems with the new Swift 3 and Realm therefore that implementation will be added later when possible.

## License

    Copyright [2016] [Daniel Ku]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.