// swift-tools-version: 5.9
import PackageDescription
import class Foundation.ProcessInfo

var package = Package(
    name: "Socket",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "Socket", targets: ["Socket"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-system", from: "1.2.1"),
    ],
    targets: [
        .target(
            name: "Socket",
            dependencies: [
                "CSocket",
                .product(
                    name: "SystemPackage",
                    package: "swift-system"
                ),
            ]
        ),
        .target(
            name: "CSocket"
        ),
        .testTarget(
            name: "SocketTests",
            dependencies: ["Socket"]
        )
    ]
)
