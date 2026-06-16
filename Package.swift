// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Glassefc",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Glassefc", targets: ["Glassefc"])
    ],
    targets: [
        .target(name: "Glassefc")
    ]
)
