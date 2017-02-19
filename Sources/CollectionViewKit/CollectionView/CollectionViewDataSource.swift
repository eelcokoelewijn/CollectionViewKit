import Foundation
import UIKit

public class CollectionViewDataSource<T: DataHandler,
                               C: CollectionViewCellConfigurator>: NSObject,
                                                                   UICollectionViewDataSource 
                                                                   where T.DataType == C.DataType {
    private let dataHandler: T
    private let configurator: C
    
    public init(dataHandler: T, configurator: C) {
        self.dataHandler = dataHandler
        self.configurator = configurator
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataHandler.numberOfSections()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataHandler.numberOfItems(inSection: section)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return configurator.configure(using: collectionView,
                                      at: indexPath,
                                      with: dataHandler.item(at: indexPath))
    }
}
