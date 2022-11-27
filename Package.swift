// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "NSObject-SafeExpectations",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "NSObject-SafeExpectations", targets: ["NSObject-SafeExpectations"])
    ],
    dependencies: [],
    targets: [
        .target(name: "NSObject-SafeExpectations"),
        .testTarget(
            name: "AllTests",
            dependencies: [.target(name: "NSObject-SafeExpectations")]
        )
    ]
)
