// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "telegram-bot",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "TelegramBot",
            targets: ["TelegramBot"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.66.1"),
        .package(url: "https://github.com/nerzh/swift-regular-expression", from: "0.2.4"),
    ],
    targets: [
        .target(
            name: "TelegramBot",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "SwiftRegularExpression", package: "swift-regular-expression"),
            ]
        ),
    ]
)
