import XCTest
@testable import CollectionViewKit

class CollectionViewKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(CollectionViewKit().text, "Hello, World!")
    }

    static var allTests: [(String, (CollectionViewKitTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample)
        ]
    }
}
