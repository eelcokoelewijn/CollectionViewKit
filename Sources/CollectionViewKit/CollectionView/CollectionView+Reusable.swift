import Foundation
import UIKit

// MARK: Reusable protocol

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

// MARK: Collection view extensions

public extension UICollectionView {
    func dequeueReusableCell<C: Reusable>(at indexPath: IndexPath) -> C {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: C.reuseIdentifier, for: indexPath) as? C else {
            fatalError("Could not cast to correct type")
        }
        return cell
    }

    func registerReusableCell<C: UICollectionViewCell>(_: C.Type) where C: Reusable {
        self.register(C.self, forCellWithReuseIdentifier: C.reuseIdentifier)
    }
}
