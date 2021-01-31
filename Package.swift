// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyConst",
    products: [
        .executable(name: "swifty-const", targets: ["SwiftyConst"]),
    ],
    dependencies: [
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50300.0")),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
        .package(url: "https://github.com/mtynior/ColorizeSwift.git", from: "1.6.0"),
    ],
    targets: [
        .target(
            name: "SwiftyConst",
            dependencies: [
                "SwiftSyntax",
                "ColorizeSwift",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        .testTarget(
            name: "SwiftyConstTests",
            dependencies: ["SwiftyConst"]),
    ]
)
