import XCTest
@testable import NCurses

final class NCursesTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NCurses().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
