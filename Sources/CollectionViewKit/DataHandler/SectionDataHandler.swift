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
        return data.count
    }
    
    public func index(forItem item: T.RowType) -> IndexPath? {
        for (index, element) in data.enumerated() {
            guard let rowIndex = element.rows.index(where: { (row: T.RowType) -> Bool in
                row == item
            }) else {
                continue
            }
            return IndexPath(row: rowIndex, section: index)
        }
        return nil
    }
    
    public func item(at index: IndexPath) -> T.RowType {
        guard index.row < data[index.section].rows.count else {
            fatalError("Index \(index.row) is out of range \(data[index.section].rows.count)")
        }
        return data[index.section].rows[index.row]
    }
    
    public func add(item: T.RowType, at index: IndexPath) {
        guard index.row < data[index.section].rows.count else {
            fatalError("Index \(index.row) is out of range \(data[index.section].rows.count)")
        }
        data[index.section].rows.insert(item, at: index.row)
    }
    
    public func add(item: T.RowType, section: T) {
        guard let index = data.index(of: section) else { return }
        data[index].rows.append(item)
    }
    
    public func remove(item: T.RowType, at index: IndexPath) {
        data[index.section].rows.remove(at: index.row)
    }
    
    public func add(item: T) {
        data.append(item)
    }
    
    public subscript(index: Int) -> T {
        get {
            return data[index]
        }
        set {
            data[index] = newValue
        }
    }
    
    public subscript(indexPath: IndexPath) -> T.RowType {
        get {
            return data[indexPath.section].rows[indexPath.row]
        }
        set {
            data[indexPath.section].rows[indexPath.row] = newValue
        }
    }
}
