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
        .binaryTarget(name: "SicSdkIos", url: "https://raw.githubusercontent.com/LLTemp/sic-sdk/1.5.10/SicSdkIos.xcframework.zip", checksum: "135803425550de5e77dba6856b92fc8d72f30b973a868d76a5eb0de0fbf3bf6c")
    ]
)
