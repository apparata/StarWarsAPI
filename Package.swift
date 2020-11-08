// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "StarWarsAPI",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(name: "StarWarsAPI", targets: ["StarWarsAPI"]),
        // Example use of API
        .executable(name: "starwars", targets: ["starwars"])
    ],
    targets: [
        .target(name: "StarWarsAPI"),
        .target(name: "starwars", dependencies: ["StarWarsAPI"])
    ]
)
