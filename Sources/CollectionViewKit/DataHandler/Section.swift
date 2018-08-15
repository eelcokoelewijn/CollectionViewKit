import Foundation

public protocol SectionInfo: Equatable {
    associatedtype RowType: Equatable
    var title: String { get }
    var rows: [RowType] { get set }
}

public struct Section<T: Equatable>: SectionInfo {
    public let title: String
    public var rows: [T]
    
    public init(title: String, rows: [T] = []) {
        self.rows = rows
        self.title = title
    }
    
    public subscript (index: Int) -> T {
        get {
            return rows[index]
        }
        set {
            rows[index] = newValue
        }
    }
}
