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
.package(url: "https://github.com/Ryu0118/SRCircleProgress", from: "0.1.0")
```
## Usage
```Swift
let circleProgressView = SRCircleProgress(frame: .zero)
view.addSubview(circleProgressView)

NSLayoutConstraint.activate([
    circleProgressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    circleProgressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    circleProgressView.widthAnchor.constraint(equalToConstant: 150),
    circleProgressView.heightAnchor.constraint(equalToConstant: 250),
])
```
