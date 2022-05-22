//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Даниил Сокол on 11.03.2022.
//

import Foundation
import UIKit

class ProfileHeaderView : UIViewController, UITableViewDataSource {
    
    let posts = Post.publications()
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        return table
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false // Отключаем "оттяжку" экрана(скролВью)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let fon : UIView = {
            let fonNew = UIView()
            fonNew.translatesAutoresizingMaskIntoConstraints = false
            fonNew.backgroundColor = .white
            return fonNew
        }()
        
        let fonForAnimation : UIView = {
            let fonTwo = UIView()
            fonTwo.translatesAutoresizingMaskIntoConstraints = false
            fonTwo.backgroundColor = .white
            fonTwo.alpha = 0.8
            return fonTwo
        }()
        
        let fonTable : UIView = {
        let fonTable = UIView()
            fonTable.translatesAutoresizingMaskIntoConstraints = false
            fonTable.backgroundColor = .systemBlue
        return fonTable
    }()
        
        
        let textImage : UILabel = {
            let text = UILabel()
            text.text = "Photos"
            text.tintColor = .black
            text.translatesAutoresizingMaskIntoConstraints = false
            text.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            return text
        }()
        
        let fotoOne : UIImageView = {
            let foto = UIImageView()
            foto.image = UIImage(named: "1")
            foto.translatesAutoresizingMaskIntoConstraints = false
            foto.layer.cornerRadius = 6
            foto.clipsToBounds = true
            return foto
        }()
        
        let fotoTwo : UIImageView = {
            let foto = UIImageView()
            foto.image = UIImage(named: "2")
            foto.translatesAutoresizingMaskIntoConstraints = false
            foto.layer.cornerRadius = 6
            foto.clipsToBounds = true
            return foto
        }()
        
        let fotoThree : UIImageView = {
            let foto = UIImageView()
            foto.image = UIImage(named: "3")
            foto.translatesAutoresizingMaskIntoConstraints = false
            foto.layer.cornerRadius = 6
            foto.clipsToBounds = true
            return foto
        }()
        
        let fotoFour : UIImageView = {
            let foto = UIImageView()
            foto.image = UIImage(named: "4")
            foto.translatesAutoresizingMaskIntoConstraints = false
            foto.layer.cornerRadius = 6
            foto.clipsToBounds = true
            return foto
        }()
        
        let rightImage : UIImageView = {
            let foto = UIImageView()
            foto.image = UIImage(named: "full_image")
            foto.translatesAutoresizingMaskIntoConstraints = false
            
            return foto
        }()
        
        var avatarImageView : UIImageView = {
            var avatarImageView = UIImageView()
            avatarImageView.image = UIImage(named: "055")
            avatarImageView.translatesAutoresizingMaskIntoConstraints = false
            avatarImageView.layer.borderColor = UIColor.white.cgColor
            avatarImageView.layer.borderWidth = 3
            avatarImageView.layer.cornerRadius = 60
            avatarImageView.clipsToBounds = true
            return avatarImageView
        }()
        
        let avatarImageViewFull : UIImageView = {
            let avatarImageViewFull = UIImageView()
            avatarImageViewFull.image = UIImage(named: "055")
            avatarImageViewFull.translatesAutoresizingMaskIntoConstraints = false
            avatarImageViewFull.layer.borderColor = UIColor.white.cgColor
            avatarImageViewFull.layer.borderWidth = 3
            avatarImageViewFull.layer.cornerRadius = 60
            avatarImageViewFull.clipsToBounds = true
            return avatarImageViewFull
        }()
        
        private let fullNameLabel :  UILabel = {
            let label = UILabel()
            label.text = "Hipster Cat"
            label.textColor = .black
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            return label
        }()
        
        private let statusLabel : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = .gray
            label.text = "Waiting for something..."
            return label
        }()
        
        private let setStatusButton : UIButton = {
            let button = UIButton(frame: CGRect(x: 100, y: 100, width: 250, height: 75))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Show status", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
            button.layer.shadowOffset.width = 4
            button.layer.shadowOffset.height = 4
            button.layer.shadowRadius = 4
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.7
            button.layer.cornerRadius = 14
            button.addTarget(self, action: #selector(pressStatusButton), for: .touchUpInside)
            return button
        }()
        
        lazy var closeAnimation : UIButton = {
            let krestik = UIButton()
            let image = UIImage(named: "krestik")
            krestik.translatesAutoresizingMaskIntoConstraints = false
            krestik.setBackgroundImage(image, for: UIControl.State.normal)
            krestik.addTarget(self, action: #selector(animateStop), for: .touchUpInside)
            return krestik
        }()
        
        private let statusTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            textField.tintColor = .black
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.cornerRadius = 12
            textField.backgroundColor = .white
            textField.textAlignment = .center
            textField.placeholder = "Change status"
            textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
            return textField
        }()
        
        private var statusText: String = ""
        
        @objc func pressStatusButton() {
            statusLabel.text = statusTextField.text
            print(statusLabel.text ?? "Non")
            print(statusText)
        }
        
        @objc func statusTextChanged(_ textField: UITextField) {
            if let text = textField.text{
                statusText = text
            }
        }
        
    
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemGray6
            self.navigationItem.setHidesBackButton(true, animated: false)
            view.addSubview(fonTable)
            view.addSubview(tableView)
            tableView.dataSource = self
            tableView.delegate = self
            addConstraints()
            setupTouchAvatar()
            _touchButton()
    
        
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: fon.safeAreaLayoutGuide.bottomAnchor, constant: -30),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
        }
        
        private func _touchButton() {
            let _touch = UITapGestureRecognizer(target: self, action: #selector(touchButton(_touch:)))
            rightImage.isUserInteractionEnabled = true
            rightImage.addGestureRecognizer(_touch)
        }
        
        @objc func touchButton(_touch: UITapGestureRecognizer) {
            _ = _touch.view as! UIImageView
            let pressTouch = OpenViewCollection()
            present(pressTouch, animated: true)
        }
        
        //Анимация аватарки
        private func setupTouchAvatar() {
            let touchAvatar = UITapGestureRecognizer(target: self, action: #selector(Tap(touchAvatar:)))
            avatarImageView.isUserInteractionEnabled = true
            avatarImageView.addGestureRecognizer(touchAvatar)
        }
        
        @objc private func Tap(touchAvatar: UITapGestureRecognizer) {
            animateStart()
        }
        
        func animateStart() {
            view.addSubview(fonForAnimation)
            view.addSubview(avatarImageView)
            view.addSubview(closeAnimation)
    
            avatarImageView.layer.borderColor = .none
            avatarImageView.layer.borderWidth = 0
            avatarImageView.layer.cornerRadius = 0
            avatarImageView.clipsToBounds = true
            
            avatarImageView.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                NSLayoutConstraint.activate([
                    self.fonForAnimation.topAnchor.constraint(equalTo: self.view.topAnchor),
                    self.fonForAnimation.bottomAnchor.constraint(equalTo:  self.view.topAnchor),
                    self.fonForAnimation.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor),
                    self.fonForAnimation.heightAnchor.constraint(equalTo:  self.view.heightAnchor),
                    self.fonForAnimation.centerXAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.centerXAnchor),
                    self.fonForAnimation.centerYAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.centerYAnchor),
                    self.avatarImageView.topAnchor.constraint(equalTo:  self.view.topAnchor, constant: 280),
                    self.avatarImageView.leftAnchor.constraint(equalTo:  self.fonForAnimation.leftAnchor),
                    self.avatarImageView.rightAnchor.constraint(equalTo:  self.fonForAnimation.rightAnchor),
                    self.avatarImageView.bottomAnchor.constraint(equalTo:  self.view.bottomAnchor, constant: -280)
                ])
                self.view.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 0) {
                    NSLayoutConstraint.activate([
                        self.closeAnimation.topAnchor.constraint(equalTo: self.fonForAnimation.safeAreaLayoutGuide.topAnchor, constant: 20),
                        self.closeAnimation.rightAnchor.constraint(equalTo: self.fonForAnimation.safeAreaLayoutGuide.rightAnchor, constant: -20),
                        self.closeAnimation.widthAnchor.constraint(equalToConstant: 20),
                        self.closeAnimation.heightAnchor.constraint(equalToConstant: 20),
                    ])
                    self.view.layoutIfNeeded()
                }
            }
        }
        
        @objc func animateStop() {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                
                NSLayoutConstraint.activate([
                    self.closeAnimation.topAnchor.constraint(equalTo: self.fonForAnimation.topAnchor, constant: -80),
                    self.closeAnimation.leftAnchor.constraint(equalTo: self.fonForAnimation.leftAnchor, constant: -80),
                    self.closeAnimation.widthAnchor.constraint(equalToConstant: 40),
                    self.closeAnimation.heightAnchor.constraint(equalToConstant: 40),
                ])
                self.closeAnimation.removeFromSuperview()
            } completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 0) {
                    self.avatarImageView.image = UIImage(named: "055")
                    self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false
                    self.avatarImageView.layer.borderColor = UIColor.white.cgColor
                    self.avatarImageView.layer.borderWidth = 3
                    self.avatarImageView.layer.cornerRadius = 60
                    self.avatarImageView.clipsToBounds = true
                    self.fonForAnimation.removeFromSuperview()
                    self.avatarImageView.removeFromSuperview()
                    self.addConstraints()
                    self.view.layoutIfNeeded()
                }
            }
        }
        //Конец анимации аватарки
        
        func addConstraints() {
            view.addSubview(fon)
            view.addSubview(textImage)
            view.addSubview(fotoTwo)
            view.addSubview(fotoThree)
            view.addSubview(fotoFour)
            view.addSubview(fotoOne)
            view.addSubview(avatarImageView)
            view.addSubview(rightImage)
            view.addSubview(avatarImageView)
            view.addSubview(fullNameLabel)
            view.addSubview(statusLabel)
            view.addSubview(statusTextField)
            view.addSubview(setStatusButton)
            
            NSLayoutConstraint.activate([
                fon.topAnchor.constraint(equalTo: setStatusButton.safeAreaLayoutGuide.bottomAnchor, constant: 20),
                fon.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
                fon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                fon.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
                fon.bottomAnchor.constraint(equalTo: fotoOne.safeAreaLayoutGuide.bottomAnchor, constant: 12),
                
                textImage.topAnchor.constraint(equalTo: fon.safeAreaLayoutGuide.topAnchor, constant: 12),
                textImage.leftAnchor.constraint(equalTo: fon.safeAreaLayoutGuide.leftAnchor, constant: 12),
                
                fotoOne.topAnchor.constraint(equalTo: textImage.safeAreaLayoutGuide.topAnchor, constant: 40),
                fotoOne.leftAnchor.constraint(equalTo: fon.safeAreaLayoutGuide.leftAnchor, constant: 12),
                fotoOne.widthAnchor.constraint(equalToConstant: 90),
                fotoOne.heightAnchor.constraint(equalToConstant: 70),
                
                fotoTwo.topAnchor.constraint(equalTo: textImage.safeAreaLayoutGuide.topAnchor, constant: 40),
                fotoTwo.leadingAnchor.constraint(equalTo: fotoOne.safeAreaLayoutGuide.leadingAnchor, constant: 94),
                fotoTwo.widthAnchor.constraint(equalToConstant: 90),
                fotoTwo.heightAnchor.constraint(equalToConstant: 70),
                
                fotoThree.topAnchor.constraint(equalTo: textImage.safeAreaLayoutGuide.topAnchor, constant: 40),
                fotoThree.rightAnchor.constraint(equalTo: fotoTwo.safeAreaLayoutGuide.rightAnchor, constant: 94),
                fotoThree.widthAnchor.constraint(equalToConstant: 90),
                fotoThree.heightAnchor.constraint(equalToConstant: 70),
                
                fotoFour.topAnchor.constraint(equalTo: textImage.safeAreaLayoutGuide.topAnchor, constant: 40),
                fotoFour.rightAnchor.constraint(equalTo: fon.safeAreaLayoutGuide.rightAnchor, constant: -5),
                fotoFour.widthAnchor.constraint(equalToConstant: 90),
                fotoFour.heightAnchor.constraint(equalToConstant: 70),
                
                rightImage.centerYAnchor.constraint(equalTo: textImage.safeAreaLayoutGuide.centerYAnchor, constant: 0),
                rightImage.rightAnchor.constraint(equalTo: fotoFour.safeAreaLayoutGuide.rightAnchor, constant: -12),
                rightImage.widthAnchor.constraint(equalToConstant: 20),
                rightImage.heightAnchor.constraint(equalToConstant: 20),
                
                avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                avatarImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
                avatarImageView.widthAnchor.constraint(equalToConstant: 130),
                avatarImageView.heightAnchor.constraint(equalToConstant: 130),
                fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
                fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 28),
                setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
                setStatusButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                setStatusButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50),
                
                statusLabel.leftAnchor.constraint(equalTo: fullNameLabel.leftAnchor, constant: 0),
                statusLabel.bottomAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 30),
                
                statusTextField.leftAnchor.constraint(equalTo: statusLabel.leftAnchor, constant: 0),
                statusTextField.bottomAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 60),
                statusTextField.heightAnchor.constraint(equalToConstant: 38),
                statusTextField.widthAnchor.constraint(equalToConstant: 130)
            ])
        }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        cell.setupCell(publications: posts[indexPath.row])
        return cell
    }
    }

extension ProfileHeaderView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
    CGFloat {
        400
    }
}
