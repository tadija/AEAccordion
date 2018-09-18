// swift-tools-version:4.2

/**
 *  https://github.com/tadija/AEAccordion
 *  Copyright (c) Marko Tadić 2015-2018
 *  Licensed under the MIT license. See LICENSE file.
 */

import PackageDescription

let package = Package(
    name: "AEAccordion",
    products: [
        .library(name: "AEAccordion", targets: ["AEAccordion"])
    ],
    targets: [
        .target(
            name: "AEAccordion"
        )
    ]
)
