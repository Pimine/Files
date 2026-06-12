// swift-tools-version:5.9

/**
 *  Files
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import PackageDescription

let package = Package(
    name: "Files",
    // Xcode 27's watchOS 27 SDK raised the minimum watchOS deployment target to
    // 9.0 and dropped the armv7k architecture. With no explicit platforms
    // declaration this package defaults to watchOS 8.0, which fails the toolchain
    // on two counts: the deployment target is below the 9.0 floor, and it still
    // emits a now-deprecated armv7k slice. Declaring watchOS 9 raises the floor
    // and drops armv7k in one step; other platforms keep their SwiftPM defaults.
    platforms: [
        .watchOS(.v9)
    ],
    products: [
        .library(name: "Files", targets: ["Files"])
    ],
    targets: [
        .target(
            name: "Files",
            path: "Sources"
        ),
        .testTarget(
            name: "FilesTests",
            dependencies: ["Files"]
        )
    ]
)
