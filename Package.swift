// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "telegram-vapor-bot",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "TelegramVaporBot",
            targets: ["TelegramVaporBot"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.45.0"),
        .package(url: "https://github.com/nerzh/swift-regular-expression", from: "0.2.4"),
    ],
    targets: [
        .target(
            name: "TelegramVaporBot",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "SwiftRegularExpression", package: "swift-regular-expression"),
            ]
        ),
    ]
)
