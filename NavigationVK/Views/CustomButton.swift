

import UIKit

class CustomButton: UIButton {
    let title: String
    let titleColor: UIColor
    let backColor: UIColor

    var tapAction: (() -> Void)?
    
    init(title: String, titleColor: UIColor, backColor: UIColor) {
        self.title = title
        self.titleColor = titleColor
        self.backColor = backColor
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backColor
        self.layer.cornerRadius = 10
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        tapAction?()
    }
}
