//
//  InfoViewController.swift
//  Navigation
//
//  Created by Даниил Сокол on 08.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private let alertButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 180, height: 55))
        button.setTitle("Show alert", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 18
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        view.addSubview(alertButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        alertButton.center = view.center
    }
    
    @objc func showAlert() {
        infoAlert()
    }
    
    func infoAlert(){
        let alert = UIAlertController(title: "Что-то важное", message: "Тут должно быть что-то важное, но мы забыли это написать!((", preferredStyle: .alert)
        let alertFirstAction = UIAlertAction(title: "Ну ладно", style: .cancel) { _ in
            print("ok")
        }
        let alertSecondAction = UIAlertAction(title: "Так добавь", style: .destructive) { _ in
            print("Добавляй")
        }
        alert.addAction(alertSecondAction)
        alert.addAction(alertFirstAction)
        present(alert, animated: true)
    }

}
