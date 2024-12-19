

<p align="center">
<img src="./Design/LCPermissionsKit.png">

<p align="center"> <b> LCPermissionsKit is a convenient wrapper on the macOS permissions API, including photos, contacts, reminders, and full disk access permissions！</b></p>


<p align="center">
  <a href="https://swiftpackageindex.com/DevLiuSir/LCPermissionsKit">
        <img src="https://img.shields.io/endpoint?url=https://swiftpackageindex.com/api/packages/DevLiuSir/LCPermissionsKit/badge?type=swift-versions" alt="Swift Versions">
    </a>
    <a href="https://swiftpackageindex.com/DevLiuSir/LCPermissionsKit">
        <img src="https://img.shields.io/endpoint?url=https://swiftpackageindex.com/api/packages/DevLiuSir/LCPermissionsKit/badge?type=platforms" alt="Supported Platforms">
    </a>
    
<img src="https://badgen.net/badge/icon/apple?icon=apple&label">
<img src="https://img.shields.io/badge/language-swift-orange.svg">
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



> [中文](README_CN.md) | [English](README.md)



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


Add `https://github.com/DevLiuSir/LCPermissionsKit.git` in the [“Swift Package Manager” tab in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).


## License

MIT License

Copyright (c) 2024 Marvin


## Author

| [<img src="https://avatars2.githubusercontent.com/u/11488337?s=460&v=4" width="120px;"/>](https://github.com/DevLiuSir)  |  [DevLiuSir](https://github.com/DevLiuSir)<br/><br/><sub>Software Engineer</sub><br/> [<img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/twitter.svg" height="20" width="20"/>][1] [<img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/github.svg" height="20" width="20"/>][2] [<img align="center" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" height="20" width="20"/>][3]|
| :------------: | :------------: |

[1]: https://twitter.com/LiuChuan_
[2]: https://github.com/DevLiuSir
[3]: https://devliusir.com/





