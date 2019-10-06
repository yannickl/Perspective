// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "Perspective",
  platforms: [
    .iOS(.v11)
  ],
  products: [
    .library(name: "Perspective", targets: ["Perspective"]),
  ],
  targets: [
    .target(
      name: "Perspective",
      dependencies: [],
      path: "Sources"),
    .testTarget(
      name: "PerspectiveTests",
      dependencies: ["Perspective"],
      path: "Tests"),
  ]
)

