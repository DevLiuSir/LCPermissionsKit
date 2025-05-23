// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LCPermissionsKit",
    platforms: [
        .macOS(.v10_15) // 指定支持的 macOS 版本
    ],
    products: [
        .library(
            name: "LCPermissionsKit",
            targets: ["LCPermissionsKit"]),
    ],
    targets: [
        .target(
            name: "LCPermissionsKit",
            dependencies: []),
        .testTarget(
            name: "LCPermissionsKitTests",
            dependencies: ["LCPermissionsKit"]),
    ]
)
