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
        .binaryTarget(name: "SicSdkIos.xcframework", url: "https://raw.githubusercontent.com/LLTemp/sic-sdk/1.5.7/SicSdkIos.xcframework.zip", checksum: "7986d0dcaa0077b4f943ecdd556847853a44a4699a51051a788a9531be45e7b8")
    ]
)
