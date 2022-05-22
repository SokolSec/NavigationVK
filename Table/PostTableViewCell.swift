//
//  PostTableViewCell.swift
//  collection
//
//  Created by Даниил Сокол on 26.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private let newView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let authorPost : UILabel = {
        let author = UILabel()
        author.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
 
    private let imagePost : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionPost : UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14)
        description.textColor = .systemGray
        description.numberOfLines = 10
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let likesPost : UILabel = {
        let likes = UILabel()
        likes.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    
    private let viewsPost : UILabel = {
        let views = UILabel()
        views.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCell() {
        contentView.backgroundColor = .systemGray6
        newView.layer.borderWidth = 1
        newView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func layout() {
        contentView.addSubview(newView)
        contentView.addSubview(imagePost)
        contentView.addSubview(authorPost)
        contentView.addSubview(descriptionPost)
        contentView.addSubview(likesPost)
        contentView.addSubview(viewsPost)
        
        NSLayoutConstraint.activate([
            newView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            newView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            newView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -8),
            newView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            newView.heightAnchor.constraint(equalToConstant: 400),
            
            authorPost.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 7),
            authorPost.bottomAnchor.constraint(equalTo: imagePost.topAnchor, constant: 8),
            authorPost.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 10),
            authorPost.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -8),
    
            
            imagePost.topAnchor.constraint(equalTo: authorPost.safeAreaLayoutGuide.topAnchor, constant: 40),
            imagePost.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 8),
            imagePost.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -8),
            imagePost.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            imagePost.heightAnchor.constraint(equalToConstant: 200),
            imagePost.widthAnchor.constraint(equalToConstant: 200),
            
            descriptionPost.topAnchor.constraint(equalTo: imagePost.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            descriptionPost.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 10),
            descriptionPost.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -8),
            descriptionPost.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            
            likesPost.topAnchor.constraint(equalTo: descriptionPost.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            likesPost.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 9),
            
            viewsPost.topAnchor.constraint(equalTo: descriptionPost.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            viewsPost.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -9)
            
            
        ])
    }
    
    func setupCell(publications: Post) {
        authorPost.text = publications.author
        imagePost.image = publications.image
        descriptionPost.text = publications.description
        likesPost.text = "Likes: \(publications.likes)"
        viewsPost.text = "Views: \(publications.views)"
    }
}
