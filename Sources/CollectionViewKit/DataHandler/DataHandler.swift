import Foundation

public protocol DataHandler {
    associatedtype DataType
    associatedtype SectionType
    
    func numberOfItems(inSection section: Int) -> Int
    func numberOfSections() -> Int
    func item(at index: IndexPath) -> DataType
    func add(item: DataType, at index: IndexPath)
    func add(item: SectionType)
    func remove(item: DataType, at index: IndexPath)
    func index(forItem item: DataType) -> IndexPath?
}
