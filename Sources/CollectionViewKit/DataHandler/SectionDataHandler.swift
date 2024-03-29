import Foundation

public class SectionDataHandler<T: SectionInfo>: DataHandler {
    public var data: [T]

    public init(data: [T]) {
        self.data = data
    }

    public convenience init() {
        self.init(data: [T]())
    }

    public func numberOfItems(inSection section: Int) -> Int {
        let totalSections = numberOfSections()
        guard section < totalSections else {
            fatalError("Section \(section) is greater then \(totalSections)")
        }
        return data[section].rows.count
    }

    public func numberOfSections() -> Int {
        data.count
    }

    public func index(forItem item: T.RowType) -> Index? {
        for (index, element) in data.enumerated() {
            guard
                let rowIndex = element.rows.firstIndex(where: { (row: T.RowType) -> Bool in
                    row == item
                })
            else {
                continue
            }
            return Index(row: rowIndex, section: index)
        }
        return nil
    }

    public func item(at index: Index) -> T.RowType {
        guard index.row < data[index.section].rows.count else {
            fatalError("Index \(index.row) is out of range \(data[index.section].rows.count)")
        }
        return data[index.section].rows[index.row]
    }

    public func add(item: T.RowType, at index: Index) {
        guard index.row < data[index.section].rows.count else {
            fatalError("Index \(index.row) is out of range \(data[index.section].rows.count)")
        }
        data[index.section].rows.insert(item, at: index.row)
    }

    public func add(item: T.RowType, section: T) {
        guard let index = data.firstIndex(of: section) else { return }
        data[index].rows.append(item)
    }

    public func remove(item: T.RowType, at index: Index) {
        data[index.section].rows.remove(at: index.row)
    }

    public func add(item: T) {
        data.append(item)
    }

    public subscript(index: Int) -> T {
        get {
            data[index]
        }
        set {
            data[index] = newValue
        }
    }

    public subscript(index: Index) -> T.RowType {
        get {
            data[index.section].rows[index.row]
        }
        set {
            data[index.section].rows[index.row] = newValue
        }
    }
}
