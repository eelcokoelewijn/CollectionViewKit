import Foundation

#if os(macOS)
import UIKit
#endif

// MARK: Reusable protocol

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}

// MARK: Collection view extensions

#if os(macOS)
public extension UICollectionView {
    func dequeueReusableCell<C: Reusable>(at indexPath: IndexPath) -> C {
        guard let cell = dequeueReusableCell(withReuseIdentifier: C.reuseIdentifier, for: indexPath) as? C else {
            fatalError("Could not cast to correct type")
        }
        return cell
    }

    func registerReusableCell<C: UICollectionViewCell>(_: C.Type) where C: Reusable {
        register(C.self, forCellWithReuseIdentifier: C.reuseIdentifier)
    }
}
#endif
