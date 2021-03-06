// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "whenTapped",
    platforms: [.iOS(.v9)],
    products: [
        .library(name: "whenTapped", targets: ["whenTapped"]),
    ],
    dependencies: [
        .package(name: "Strongify", url: "https://gitee.com/yxspecs/Strongify.git", from: "1.2.1"),
    ],
    targets: [.target(name: "whenTapped", dependencies: ["Strongify"])],
    swiftLanguageVersions: [.v5]
)
