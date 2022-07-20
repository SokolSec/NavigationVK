

import UIKit

// MARK: - FeedFlowCoordinator
final class FeedFlowCoordinator {

    func showInfo(nc: UINavigationController?, coordinator: FeedFlowCoordinator) {
        let vc = InfoViewController()
        nc?.pushViewController(vc, animated: true)
    }
}
