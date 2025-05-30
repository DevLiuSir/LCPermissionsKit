

<p align="center">
<img src="./Design/LCPermissionsKit.png">

<p align="center"> <b> LCPermissionsKit 是 macOS 权限 API 的便捷包装器，包括照片、联系人、提醒和完整磁盘访问权限！</b></p>


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
<img src="https://img.shields.io/badge/macOS-10.13+-blue.svg">
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



当前实现支持以下权限：

* [Calendar](#calendar)
* [Contacts](#contacts)
* [Reminders](#reminders)
* [Photos](#photos)
* [Full Disk Access](#full-disk-access)




## 权限类型

```swift
public enum LCPermissionType: Int {
    case calendar = 0
    case reminders
    case contacts
    case photos
    case fullDiskAccess
}
```



## 使用

- 检查权限状态

```swift
let status = LCPermissionsKit.shared.authorizationStatus(for: .fullDiskAccess)
switch status {
case .authorized:
    print("authorized")
case .notDetermined:
    print("notDetermined")
case .denied:
    print("denied")
case .limited:
    print("limited")
}
```

- 请求权限

```swift
 LCPermissionsKit.shared.requestAuthorization(for: .fullDiskAccess) { status in
	print(status)   
}
```





## 日历
10.9+

`NSCalendarsUsageDescription` 需要在 info.plist 中输入密钥

## 联系人
10.11+

`NSContactsUsageDescription` 需要在 info.plist 中输入密钥

## 提醒事项
10.9+

`NSRemindersUsageDescription` 需要在 info.plist 中输入密钥

## 照片
10.13+

`NSPhotoLibraryUsageDescription` 需要在 info.plist 中输入密钥

## 完全磁盘访问
10.14+

调用权限打开“首选项”->“隐私”，并选择“完全磁盘访问”部分


## 安装

### CocoaPods
PermissionsKit 可通过 [CocoaPods](https://cocoapods.org) 获取。要安装它，只需将以下行添加到您的 Podfile 中：

```swift

pod 'LCPermissionsKit'

```

### SwiftPackage


添加 `https://github.com/DevLiuSir/LCPermissionsKit.git` 在 [Xcode 中的“Swift Package Manager”选项卡](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).


## 许可证

MIT License

Copyright (c) 2024 Marvin


## 作者

| [<img src="https://avatars2.githubusercontent.com/u/11488337?s=460&v=4" width="120px;"/>](https://github.com/DevLiuSir)  |  [DevLiuSir](https://github.com/DevLiuSir)<br/><br/><sub>Software Engineer</sub><br/> [<img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/twitter.svg" height="20" width="20"/>][1] [<img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/github.svg" height="20" width="20"/>][2] [<img align="center" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" height="20" width="20"/>][3]|
| :------------: | :------------: |

[1]: https://twitter.com/LiuChuan_
[2]: https://github.com/DevLiuSir
[3]: https://devliusir.com/



