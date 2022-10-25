// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GRIG-SDK",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "GRIG-SDK",
            targets: ["GRIGSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apollographql/apollo-ios", branch: "main"),
    ],
    targets: [
        .binaryTarget(name: "GRIGSDK", path: "./Sources/GRIGSDK.xcframework"),
    ]
)
