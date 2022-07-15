import Foundation
#if os(macOS)
import UIKit
#endif

#if os(macOS)
public protocol CollectionViewCellConfigurator {
    associatedtype DataType
    func configure(using collectionView: UICollectionView, at index: IndexPath, with model: DataType) -> UICollectionViewCell
}
#endif
