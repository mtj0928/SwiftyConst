import XCTest
@testable import SwiftyConst

final class SwiftyConstTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftyConst().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
