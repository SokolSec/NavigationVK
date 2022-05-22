//
//  OpenViewCollectionCell.swift
//  Navigation
//
//  Created by Даниил Сокол on 07.04.2022.
//

import UIKit

class OpenViewCollectionCell: UICollectionViewCell {
    
    static let identifier = "PhotosViewController"
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemMint
        contentView.addSubview(imageView)
        
        let images = [
            UIImage(named: "1"),
            UIImage(named: "2"),
            UIImage(named: "3"),
            UIImage(named: "4"),
            UIImage(named: "5"),
            UIImage(named: "6"),
            UIImage(named: "7"),
            UIImage(named: "8"),
            UIImage(named: "9"),
            UIImage(named: "10"),
            UIImage(named: "11"),
            UIImage(named: "12"),
            UIImage(named: "13"),
            UIImage(named: "14"),
            UIImage(named: "15"),
            UIImage(named: "16"),
            UIImage(named: "17"),
            UIImage(named: "18"),
            UIImage(named: "19"),
            UIImage(named: "20")
        ].compactMap({$0})
        
        imageView.image = images.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
