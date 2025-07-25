// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription



let package = Package(
    name: "LottieViewSpmModule",
    platforms: [
        .iOS(.v14) // или выше, в зависимости от требований
    ],
    products: [
        .library(
            name: "LottieViewSpmModule",
            targets: ["LottieViewSpmModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.4.0")
    ],
    targets: [
        .target(
            name: "LottieViewSpmModule",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios")
            ],
            path: "Sources" // укажи путь к исходникам
        ),
        .testTarget(
            name: "LottieViewSpmModuleTests",
            dependencies: ["LottieViewSpmModule"],
            path: "Tests"
        )
    ]
)
