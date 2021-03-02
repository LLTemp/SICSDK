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
        .binaryTarget(name: "sic-sdk-binary", url: "https://raw.githubusercontent.com/LLTemp/sic-sdk/1.5.7/SicSdkIos.xcframework.zip", checksum: "26faec9c52ea38481fffe013df8d1033dfad385ea0a4cbe52402b8e688119c8d")
    ]
)
