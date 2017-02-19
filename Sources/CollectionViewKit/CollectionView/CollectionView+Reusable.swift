import Foundation
import UIKit

// MARK: Reusable protocol

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    public static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

// MARK: Collection view extensions

public extension UICollectionView {
    public func dequeueReusableCell<C: Reusable>(at indexPath: IndexPath) -> C {
        return self.dequeueReusableCell(withReuseIdentifier: C.reuseIdentifier, for: indexPath) as! C
    }
    
    public func registerReusableCell<C: UICollectionViewCell>(_: C.Type) where C: Reusable {
        self.register(C.self, forCellWithReuseIdentifier: C.reuseIdentifier)
    }
}
