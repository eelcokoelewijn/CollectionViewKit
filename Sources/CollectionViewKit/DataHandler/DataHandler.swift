import Foundation

public protocol DataHandler {
    associatedtype DataType
    associatedtype SectionType

    func numberOfItems(inSection section: Int) -> Int
    func numberOfSections() -> Int
    func item(at index: Index) -> DataType
    func add(item: DataType, at index: Index)
    func add(item: SectionType)
    func remove(item: DataType, at index: Index)
    func index(forItem item: DataType) -> Index?
}
