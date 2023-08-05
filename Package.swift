// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FFmpeg-iOS-Support",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FFmpeg-iOS-Support",
            targets: [
                "Depend", "Hook", "FFmpegSupport", "libavdevice", "libfftools"
            ]),
    ],
    targets: [
        .target(name: "Depend",
                linkerSettings: [
                    .linkedLibrary("z"),
                    .linkedLibrary("bz2"),
                    .linkedLibrary("iconv"),
                    .linkedFramework("AVFoundation"),
                    .linkedFramework("VideoToolbox"),
                    .linkedFramework("CoreMedia"),
                ]
        ),
        .target(name: "Hook", dependencies: [
            "Depend",
        ]),
        .target(name: "FFmpegSupport", dependencies: [
            "Hook",
        ]),
        .binaryTarget(name: "libavdevice", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/v0.0.6-b20230416-173821/avdevice.zip", checksum: "5e8bebaae6ef03dfeab3166fa34852728a4c1eac40d9dafcd6b4cb1f71055174"),
        .binaryTarget(name: "libfftools", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/v0.0.6-b20230416-173821/fftools.zip", checksum: "da3e909deb1ee98ef2425a2a4640b663fbb84ecc4204d663b1959c8de587acc7"),
    ]
)
