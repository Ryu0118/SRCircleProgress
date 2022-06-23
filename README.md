# SRCircleProgress
[![Release](https://img.shields.io/github/v/release/Ryu0118/SRCircleProgress)](https://github.com/Ryu0118/SRCircleProgress/releases/latest)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/StringTransform.svg)](https://cocoapods.org/pods/SRCircleProgress)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Ryu0118/SRCirclrProgress)
[![Swift Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRyu0118%2FSRCircleProgress%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Ryu0118/SRCircleProgress)
[![Platform Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRyu0118%2FSRCircleProgress%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Ryu0118/SRCircleProgress)
[![License](https://img.shields.io/github/license/Ryu0118/SRCircleProgress)](https://github.com/Ryu0118/SRCircleProgress/blob/main/LICENSE)
[![Twitter](https://img.shields.io/twitter/follow/ryu_hu03?style=social)](https://twitter.com/ryu_hu03)

Customizable circle progress bar written in Swift.

## Installation
### Requirements
- iOS13.0+
### CocoaPods
SRCircleProgress is available through CocoaPods. To install it, add the following to your Podfile:
```Ruby
pod 'SRCircleProgress'
```
### Swift Package Manager
SRCircleProgress is also available through Swift Package Manager. Add SRCircleProgress as a dependency to your Package.swift:
```Swift
.package(url: "https://github.com/Ryu0118/SRCircleProgress", from: "0.2.1")
```
## Usage
The basic usage is as follows.
```Swift
let circleProgressView = SRCircleProgress(frame: .zero)
circleProgressView.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(circleProgressView)

NSLayoutConstraint.activate([
    circleProgressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    circleProgressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    circleProgressView.widthAnchor.constraint(equalToConstant: 150),
    circleProgressView.heightAnchor.constraint(equalToConstant: 150),
])
```
To set the progress on the progress bar, 
```Swift
circleProgressView.setProgress(0.5, animated: true)
```
The current progress is represented by a floating-point value between 0.0 and 1.0, inclusive, where 1.0 indicates the completion of the task. The default value is 0.0. Values less than 0.0 and greater than 1.0 are pinned to those limits.

### Properties
```Swift
circleProgressView.progress = 0.6 // Set the progress without animation.
circleProgressView.isReverse = false // Reverse the direction of the color to be filled.
circleProgressView.percent = 60 // Set the percent without animation
circleProgressView.progressLineColor = .systemBlue // The color shown for the portion of the progress view that is filled.
circleProgressView.progressLineWidth = 6 // Specifies the line width of the progress view.
circleProgressView.backgroundLineWidth = 12 // Specifies the line width of the view behind the progress view.
circleProgressView.animationDuration = 0.2 // Specifies the duration of the animation when setProgress(_:animated:) is executed
circleProgressView.progressAngle = .lowerLeftToLowerRight(offset: 0) // Change the shape of the progress view
```
To change the shape of the progress view, use the `progressAngle` property.
Possible values for `progressAngle` are as follows
```Swift
enum ProgressAngle {
    case topToTop
    case bottomToBottom
    case lowerLeftToLowerRight(offset: Double = 0)
    case leftToRight(offset: Double = 0)
}
```
|topToTop|bottomToBottom|
|---|---|
|![topToTop](https://user-images.githubusercontent.com/87907656/173399400-fd6a3be6-80ae-46c6-ab73-ba86c4831842.png)|![bottomToBottom](https://user-images.githubusercontent.com/87907656/173399395-7fbf8aad-fd00-4b54-bd2e-4129a20c196f.png)|
|leftToRight(offset = 0)|lowerLeftToLowerRight(offset = 0)|
|![leftToRight](https://user-images.githubusercontent.com/87907656/173399384-781f3f3d-2f05-4e66-bb4e-a8585e828b57.png)|![lowerLeftToLowerRight](https://user-images.githubusercontent.com/87907656/173399405-e36b8b44-4479-4c5e-970b-5007803d0103.png)|
