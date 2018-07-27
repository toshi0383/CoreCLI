import XCTest
@testable import CoreCLI

final class CoreCLITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CoreCLI().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
