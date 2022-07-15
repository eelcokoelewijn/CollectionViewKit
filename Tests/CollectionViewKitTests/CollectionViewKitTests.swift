@testable import CollectionViewKit
import XCTest

final class CollectionViewKitTests: XCTestCase {
    func testSection() {
        let subject = Section(title: "Planets", rows: ["Earth", "Moon"])
        XCTAssertEqual(subject.title, "Planets")
        XCTAssertEqual(subject.rows.count, 2)
    }

    func testIndex() {
        let subject = Index(row: 1, section: 5)
        XCTAssertEqual(subject.row, 1)
        XCTAssertEqual(subject.section, 5)
    }
}
