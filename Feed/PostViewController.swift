//
//  PostViewController.swift
//  Navigation
//
//  Created by Даниил Сокол on 08.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    private let infoVC = InfoViewController()
    private var newPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemIndigo
        title = "Post"
        
        let infoButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(showInfo))
        self.navigationItem.rightBarButtonItem = infoButton
    }
    

    @objc func showInfo() {
        present(infoVC, animated: true)
    }

}
