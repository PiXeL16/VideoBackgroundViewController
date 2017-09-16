![Banner](/Web/videoBackgroundViewControllerBanner.png)

[![Build Status](https://travis-ci.org/PiXeL16/VideoBackgroundViewController.svg?branch=master)](https://travis-ci.org/PiXeL16/VideoBackgroundViewController/) [![codecov.io](https://img.shields.io/cocoapods/v/VideoBackgroundViewController.svg)](https://img.shields.io/cocoapods/v/VideoBackgroundViewController.svg) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PiXeL16/VideoBackgroundViewController/master/LICENSE)

# VideoBackgroundViewController
A View Controller that shows a video in the background, like Spotify!

![VideoBackgroundViewControllerGif](/Web/videoBackgroundViewController.gif)

:star: Features
---
* Customizable video URL.
* Play video with sound or not.
* Customizable sound level.
* Customizable video alpha channel.
* Loop the video or not
* Customizable video scaling mode. Resize, ResizeAspect, ResizeAspectFill(Default)
* Works in portrait and landscape orientation

:octocat: Installation
---
Get `VideoBackgroundViewController` on CocoaPods, just add `pod 'VideoBackgroundViewController'` to your `Podfile` and then run `pod install`.


:metal: Usage
---
Usage is pretty easy, just inherid your ViewController from `VideoBackgroundViewController` and set your initial video URL like:
```
import VideoBackgroundViewController

override func viewDidLoad() {
     super.viewDidLoad()

     let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("spotifyVideo", ofType: "mp4")!)

     self.videoURL = url
 }
```

You can also customize the default values like:

```
import VideoBackgroundViewController

override func viewDidLoad() {
     super.viewDidLoad()

     let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("spotifyVideo", ofType: "mp4")!)

     self.videoURL = url
     self.videoFrame = view.frame
     self.videoShouldLoop = true
     self.alpha = 0.5
     self.playSound = true
     self.videoScalingMode = .ResizeAspectFill
 }
```

TODO
-----
* Protocolize the f*ck out of this
* Better code coverage

:alien: Author
------
Chris Jimenez - http://chrisjimenez.net, [@chrisjimeneznat](http://twitter.com/chrisjimeneznat)

Some ideas where taken from https://github.com/allenwong/30DaysofSwift

:beer: Donate
------
If you want to buy me a beer, you can donate to my coin addresses below:
#### BTC
1BeGBew4CBdLgUSmvoyiU1LrM99GpkXgkj
#### ETH
0xa59a3793E3Cb5f3B1AdE6887783D225EDf67192d
#### LTC
Ld6FB3Tqjf6B8iz9Gn9sMr7BnowAjSUXaV

## License
`VideoBackgroundViewController` is released under the MIT license. See [LICENSE](https://github.com/pixel16/VideoBackground/blob/master/LICENSE) for details.
