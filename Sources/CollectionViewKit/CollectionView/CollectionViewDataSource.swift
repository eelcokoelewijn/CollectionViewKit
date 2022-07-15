import Foundation
#if os(macOS)
import UIKit
#endif

#if os(macOS)
public class CollectionViewDataSource<T: DataHandler, C: CollectionViewCellConfigurator>: NSObject, UICollectionViewDataSource where T.DataType == C.DataType {
    public init(dataHandler: T, configurator: C) {
        self.dataHandler = dataHandler
        self.configurator = configurator
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataHandler.numberOfSections()
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataHandler.numberOfItems(inSection: section)
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        configurator.configure(
            using: collectionView,
            at: indexPath,
            with: dataHandler.item(at: Index(from: indexPath))
        )
    }

    private let dataHandler: T
    private let configurator: C
}
#endif
