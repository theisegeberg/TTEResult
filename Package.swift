// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "TTEResult",
  products: [
    .library(
      name: "TTEResult",
      targets: ["TTEResult"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "TTEResult",
      dependencies: []),
    .testTarget(
      name: "TTEResultTests",
      dependencies: ["TTEResult"]),
  ]
)
