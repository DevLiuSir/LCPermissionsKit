

<p align="center">
<img src="./Design/LCPermissionsKit.png">

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


## Usage

```swift
 LCPermissionsKit.shared.requestAuthorization(for: .fullDiskAccess) { status in
	print(status)   
}
```


## Permission Type

```swift
public enum LCPermissionType: Int {
    case calendar = 0
    case reminders
    case contacts
    case photos
    case fullDiskAccess
}
```




## Calendar
10.9+

`NSCalendarsUsageDescription` key in info.plist is required.

## Contacts
10.11+

`NSContactsUsageDescription` key is required in Info.plist

## Reminders
10.9+

`NSRemindersUsageDescription` key is required in Info.plist

## Photos
10.13+

`NSPhotoLibraryUsageDescription` key is required in Info.plist

## Full Disk Access
10.14+

Calling for permissions opens Preferences->Privacy with selected "Full Disk Access" section.


## Installation

### CocoaPods
PermissionsKit is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```swift

pod 'LCPermissionsKit'

```

### SwiftPackage


Add `https://github.com/DevLiuSir/LCPermissionsKit` in the [“Swift Package Manager” tab in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).


## License

MIT License

Copyright (c) 2024 Marvin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.






