import XCTest
@testable import CollectionViewKit

final class CollectionViewKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Section<String>(title: "Planets").title, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
