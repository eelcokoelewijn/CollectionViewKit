import Foundation
#if os(macOS)
import UIKit
#endif

public struct Index: Equatable {
    let row: Int
    let section: Int
}

#if os(macOS)
extension Index {
    init(from: IndexPath) {
        self.row = indexPath.row
        self.section = indexPath.section
    }
}
#endif
