// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swift-bip158",
    products: [
        .library(
            name: "BIP158",
            targets: ["BIP158"]),
    ],
    targets: [
        .target(
            name: "chiabip158",
            dependencies: [],
            path: "Sources/chiabip158",
            sources: [
                "src/blockfilter.cpp",
                "src/crypto/sha256.cpp",
                "src/crypto/siphash.cpp",
                "src/primitives/block.cpp",
                "src/primitives/transaction.cpp",
                "src/script/script.cpp",
                "src/util/strencodings.cpp",
                "src/util/bytevectorhash.cpp",
                "src/uint256.cpp"
            ],
            publicHeadersPath: "./",
            cxxSettings: [
                .headerSearchPath("src")
            ]),
        .target(
            name: "ObjCBIP158",
            dependencies: ["chiabip158"],
            path: "Sources/ObjCBIP158",
            cxxSettings: [
                .headerSearchPath("../chiabip158/src")
            ]),
        .target(
            name: "BIP158",
            dependencies: ["ObjCBIP158"]),
        .testTarget(
            name: "BIP158Tests",
            dependencies: ["BIP158"]),
    ],
    cxxLanguageStandard: .cxx17
)
