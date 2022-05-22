//
//  FeedViewController.swift
//  Navigation
//
//  Created by Даниил Сокол on 03.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let postVC = PostViewController()
    
    private let showPostButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let showPostButtonOne: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show post 1", for: .normal)
        button.layer.cornerRadius = 18
        button.backgroundColor = .systemYellow
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
    private let showPostButtonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show post 2", for: .normal)
        button.layer.cornerRadius = 18
        button.backgroundColor = .systemYellow
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        title = "Feed"
        
        addView()
        stackViewConstraints()
        addButtonsToStackView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func addView() {
        [showPostButtons, showPostButtonOne, showPostButtonTwo].forEach{ view.addSubview($0) }
    }
    
    
    
    @objc func showPost(){
        let navVC = UINavigationController(rootViewController: postVC)
        navVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(postVC, animated: true)
        
    }
    
    private func stackViewConstraints() {
        NSLayoutConstraint.activate([
            showPostButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showPostButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showPostButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            showPostButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            showPostButtons.heightAnchor.constraint(equalToConstant: 130)
            
        ])
    }
    
    private func addButtonsToStackView() {
        showPostButtons.addArrangedSubview(showPostButtonOne)
        showPostButtons.addArrangedSubview(showPostButtonTwo)
    }

}
