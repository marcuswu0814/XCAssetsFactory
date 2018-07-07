// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XCAssetsFactory",
    dependencies: [
        .package(url: "https://github.com/marcuswu0814/SwiftCLIToolbox", .branch("master")),
    ],
    targets: [
        .target(
            name: "XCAssetsFactory",
            dependencies: ["XCAssetsFactoryCore"]),
        .target(
            name: "XCAssetsFactoryCore",
            dependencies: ["SwiftCLIToolbox"]),
        .testTarget(
            name: "XCAssetsFactoryTest",
            dependencies: ["XCAssetsFactoryCore"])
    ]
)
