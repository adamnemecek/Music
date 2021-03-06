// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Music",
    products: [
        .library(name: "Articulations", targets: ["Articulations"]),
        .library(name: "Dynamics", targets: ["Dynamics"]),
        .library(name: "Pitch", targets: ["Pitch"]),
        .library(name: "MetricalDuration", targets: ["MetricalDuration"]),
        .library(name: "Rhythm", targets: ["Rhythm"]),
        .library(name: "Tempo", targets: ["Tempo"]),
        .library(name: "Meter", targets: ["Meter"]),
        .library(name: "MusicModel", targets: ["MusicModel"])
    ],
    dependencies: [
        .package(url: "https://github.com/dn-m/Structure", from: "0.3.0"),
        .package(url: "https://github.com/dn-m/Math", from: "0.1.3")
    ],
    targets: [

        // Sources
        .target(name: "Articulations", dependencies: []),
        .target(name: "Dynamics", dependencies: ["Destructure", "DataStructures"]),
        .target(name: "Pitch", dependencies: ["Math", "DataStructures"]),
        .target(name: "Rhythm", dependencies: ["MetricalDuration"]),
        .target(name: "MetricalDuration", dependencies: ["Math", "DataStructures"]),
        .target(name: "Tempo", dependencies: ["Rhythm"]),
        .target(name: "Meter", dependencies: ["Rhythm", "Tempo"]),
        .target(
            name: "MusicModel", 
            dependencies: [
                "Algebra",
                "DataStructures",
                "Articulations",
                "Pitch",
                "Rhythm",
                "Tempo",
                "Meter"
            ]
        ),

        // Tests
        .testTarget(name: "ArticulationsTests", dependencies: ["Articulations"]),
        .testTarget(name: "DynamicsTests", dependencies: ["Dynamics"]),
        .testTarget(name: "PitchTests", dependencies: ["Pitch"]),
        .testTarget(name: "RhythmTests", dependencies: ["Rhythm"]),
        .testTarget(name: "MetricalDurationTests", dependencies: ["MetricalDuration"]),
        .testTarget(name: "TempoTests", dependencies: ["Tempo"]),
        .testTarget(name: "MeterTests", dependencies: ["Meter"]),
        .testTarget(name: "MusicModelTests", dependencies: ["MusicModel"])
    ]
)
