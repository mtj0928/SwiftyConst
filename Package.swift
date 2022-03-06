// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let rpath = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx"

let package = Package(
    name: "SwiftyConst",
    products: [
        .executable(name: "swifty-const", targets: ["SwiftyConst"]),
    ],
    dependencies: [
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50500.0")),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.4"),
        .package(url: "https://github.com/mtynior/ColorizeSwift.git", from: "1.6.0"),
    ],
    targets: [
        .target(
            name: "SwiftyConst",
            dependencies: [
                "SwiftSyntax",
                "ColorizeSwift",
                "Yams",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            linkerSettings: [
                .unsafeFlags(["-rpath", rpath])
            ]
        )
    ]
)
