# Word Buzzer
This project is a coding challenge, which is a part of a interview process. There were two options to chose: (1)Falling Words and (2) Word Buzzer. I took the liberty to choose the second option.

## Description
The task is to write a small multiplayer language game for one device. The game screen will contain a "buzzer" button in each corner of the screen - one for each possible player.
The players will see a word in language "one" in the middle of the screen. While this word is displayed, a word in language "two" will fade in from some border of the screen, move over the screen and then fade out again within just a few of seconds (1-3s). After one word is faded out, a new word is faded in.
The players hit their buzzer when they think the correct translation set is presented. The first one hitting his button will either be right or wrong and the next round is started with a new target word in the middle. There should be some feedback to the players telling them how well they are doing.
It should be ensured that the correct word will be shown at a frequent enough pace.

**Room for creativity**: The applicant can choose how to implement the success or failure feedback to the players.

## Project Specification
| Xcode  | 10.2.1  |
| ------------ | ------------ |
| **Development SDK**  |  **iOS 12.0 ** |
| **Minimum supported SDK**  |  **iOS 10.0**  |
| **Language**  | **Swift 4.2**  |
|  **Cocoapod** | **1.7.3**  |
| **Supported Devices** | **iPhone**(Room for improvement) |
| **Orientation Support** | **Universal** |
| **Aknowledgement** | [Almofire](https://github.com/Alamofire/Alamofire), [SCLAlertView](https://github.com/vikmeup/SCLAlertView-Swift)|

## How To Run
- Download the project as .zip file or clone is using following command:
`git clone https://github.com/mjhassan/WordBuzzer.git`
- Pod files should be in project. If you face any issue, update/install the pods using `pod install` or `pod update`.
- Double click `WordBuzzer.xcworkspace` file to open with Xcode.
- Hit run

## Implementation
- MVVM architectural pattern is used to implement the project. It is convenient for small project to ensure unit test.
- There are both online and offline data consumption feature implemented. If device is online it will fetch JSON from provided url. Otherwise and if case of decoding failure it will use local JSON, provided in reqirement bundle.
- There are two 3rd party libraries, Almofire and SCLAlertView, intergrated using cocoapod to demonstrate 3rd party integration capability.
- Unit tests are written, as much as I could in that period of time. Much room for improvement.
- For the wrong answers a random probability of 20% is used. That means, within 5 translations are being displayed one will be the correct answer.

## Expectation Fulfillment
- **Invested time**: around 10 hours
- **Distributed time**: roughly, concept - 4 hrs(Own investment, not included), models - 2 hrs, view+viewmodel+machanics - ~8 hrs
- **Decisions**:
	- To solve:
		- Not using SpriteKit.
		- Sticking with storyboard only. Xib or programming UI implementation could be used.
		- Usage of MVVM design patters, to ensure easier unit testability for small project.
		- Not using singleton.
	- For time restriction:
		- Discard TDD
		- Lesser unit tests
		- Discard UI test
		- Avoid Quick/Nimble for unit test
		- iPad support
		- Landscape orientation issues
		- Automated build system, e.g. fastlane
		- Sticking to the skeleton app only, not using much resources.
		- Reactive programming practise (I'm to proficient in RxSwift or combine, so will be needed much time to learn and then apply :) )
- **Immediate improvements:**
	- Fixing landscape orientation issues.
	- iPad support.
	- Thorough unit test, maybe TDD.

## Credit
Jahid Hassan has created this project as a coding challenge. For any issue or query, please send me a mail at jahid.hassan.ce@gmail.com . You can check my linkedin profile [here](https://www.linkedin.com/in/mjhassan).
