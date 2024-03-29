// swift-tools-version: 5.5

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "ReaderTranslator",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "ReaderTranslator",
            targets: ["AppModule"],
            displayVersion: "1.0",
            bundleVersion: "1",
            iconAssetName: "AppIcon",
            accentColorAssetName: "AccentColor",
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", "1.5.0"..<"2.0.0"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", "2.2.2"..<"3.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "Resolver", package: "Resolver"),
                .product(name: "SwiftSoup", package: "swiftsoup")
            ],
            path: ".",            
            resources: [
                .process("JScript/cambridge.js"),
                .process("JScript/cambridge.json"),
                .process("JScript/collins.js"),
                .process("JScript/deep-L.js"),
                .process("JScript/gtranslator-reverso-speaker.js"),
                .process("JScript/gtranslator.js"),
                .process("JScript/longman.js"),
                .process("JScript/longman.json"),
                .process("JScript/merriam-webster.json"),
                .process("JScript/reader-translator.js"),
                .process("JScript/reverso.js")
            ]

        )
    ]
)