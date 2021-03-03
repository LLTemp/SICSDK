// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "sic-sdk",
    
    products: [
        .library(name: "sic-sdk", targets: ["sic-sdk"]),
    ],
    
    dependencies: [
        .package(name: "KeychainSwift", url: "https://github.com/evgenyneu/keychain-swift.git", from: "19.0.0")
    ],
    
    targets: [
        .target(
            name: "sic-sdk",
            dependencies: [
                .target(name: "sic-sdk-wrapper")
              ]
            ),
        .target(
                name: "sic-sdk-wrapper",
                dependencies: [
                    .target(name: "SicSdkIos"),
                    .product(name: "KeychainSwift", package: "KeychainSwift"),
                ]
        ),
        .binaryTarget(name: "SicSdkIos", url: "https://raw.githubusercontent.com/LLTemp/sic-sdk/1.5.11/SicSdkIos.xcframework.zip", checksum: "4a14ec9d89010f75258e9c6b59c3c06f9dbe09987c0d7c81bb352226fa31a594")
    ]
)
