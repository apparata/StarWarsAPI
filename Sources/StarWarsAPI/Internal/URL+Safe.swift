
import Foundation

extension URL {
    init(safe: String) {
        // swiftlint:disable:next force_unwrapping
        self.init(string: safe)!
    }
}
