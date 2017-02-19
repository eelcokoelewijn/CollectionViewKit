import Foundation
import UIKit

public protocol CollectionViewCellConfigurator {
    associatedtype DataType
    func configure(using collectionView: UICollectionView,
                   at index: IndexPath,
                   with model: DataType) -> UICollectionViewCell
}
