// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
    name: "nearclientios",
    platforms: [
        .iOS(.v13),
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "nearclientios",
            targets: ["nearclientios"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/bitmark-inc/tweetnacl-swiftwrap.git", from: "1.1.0"),
        .package(url: "https://github.com/Flight-School/AnyCodable.git", from: "0.6.0"),
        .package(url: "https://github.com/21-DOT-DEV/swift-secp256k1", .upToNextMinor(from: "0.10.0")),
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "nearclientios",
            dependencies: [
                "BigInt",
                .product(name: "TweetNacl", package: "tweetnacl-swiftwrap"),
                "AnyCodable",
                .product(name: "secp256k1", package: "swift-secp256k1"),
            ],
            path: "./nearclientios/Sources"
        ),
    ]
)
