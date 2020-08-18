import Foundation

extension String {

    enum Strings: String {
        case okey
        case error
    }

    var localized: String { NSLocalizedString(self, comment: self) }

    //MARK: - Inits

    init(_ localized: Strings) {
        self.init(localized.rawValue.localized)
    }
}
