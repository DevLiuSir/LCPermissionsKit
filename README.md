

<p align="center">
<img src="./Design/LCPermissionsKit-03.png">

<p align="center"> <b> LCPermissionsKit is a convenient wrapper on the macOS permissions API, including photos, contacts, reminders, and full disk access permissions</b></p>


<p align="center">
<img src="https://badgen.net/badge/icon/apple?icon=apple&label">
<img src="https://img.shields.io/badge/language-swift-orange.svg">
<a href="https://developer.apple.com/swift/"><img src="https://img.shields.io/badge/swift-5.3+-blue.svg?style=flat"></a>
<img src="https://img.shields.io/badge/xcode-14.2+-yellow.svg">
<img src="https://img.shields.io/badge/macOS10.13+-blue.svg">
<img src="https://img.shields.io/badge/build-passing-brightgreen">
<img src="https://img.shields.io/github/languages/top/DevLiuSir/LCPermissionsKit?color=blueviolet">
<img src="https://img.shields.io/github/license/DevLiuSir/LCPermissionsKit.svg">
<img src="https://img.shields.io/badge/platform-osx-lightgrey.svg">
<img src="https://img.shields.io/github/languages/code-size/DevLiuSir/LCPermissionsKit?color=ff69b4&label=codeSize">
<img src="https://img.shields.io/github/repo-size/DevLiuSir/LCPermissionsKit">
<img src="https://img.shields.io/github/last-commit/DevLiuSir/LCPermissionsKit">
<img src="https://img.shields.io/github/commit-activity/m/DevLiuSir/LCPermissionsKit">
<img src="https://img.shields.io/github/stars/DevLiuSir/LCPermissionsKit.svg?style=social&label=Star">
<img src="https://img.shields.io/github/forks/DevLiuSir/LCPermissionsKit?style=social">
<img src="https://img.shields.io/github/watchers/DevLiuSir/LCPermissionsKit?style=social">
<a href="https://twitter.com/LiuChuan_"><img src="https://img.shields.io/twitter/follow/LiuChuan_.svg?style=social"></a>
</p>



Current implementation supports permissions for: 

* [Calendar](#calendar)
* [Contacts](#contacts)
* [Reminders](#reminders)
* [Photos](#photos)
* [Full Disk Access](#full-disk-access)



## Installation

### CocoaPods
PermissionsKit is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```swift

pod 'LCPermissionsKit'

```

### SwiftPackage


Add `https://github.com/DevLiuSir/LCPermissionsKit` in the [“Swift Package Manager” tab in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).


### Usage

```swift
 LCPermissionsKit.shared.requestAuthorization(for: .fullDiskAccess) { status in
	print(status)   
}
```






