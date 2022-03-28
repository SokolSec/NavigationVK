//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by mitr on 09.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animateAvatar))
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func animateAvatar() {
        UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
            self.avatarImageView.transform = CGAffineTransform(translationX: 100, y: 200)
        })
    }
    
    
    
    private var statusText = "Подожтите..."
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
//        view.alpha = 0
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 55
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "МитрофанОглы"
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = statusText
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.shadowColor = UIColor.black.cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 2))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.delegate = self
        return textField
    }()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let newStatusText = textField.text {
            if newStatusText != "" {
                statusText = newStatusText
                setStatusButton.setTitle("Установить статус", for: .normal)
            }
        }
    }
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать статус", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.backgroundColor = UIColor(named: "AccentColor")
        button.layer.cornerRadius = 12
        button.layer.shadowOffset.width = 3
        button.layer.shadowOffset.height = 3
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.6
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func buttonPressed() {
        statusLabel.text = statusText
        setStatusButton.setTitle("Показать статус", for: .normal)
    }
    
    
    
    private func layout() {
        [backgroundView, avatarImageView, fullNameLabel, statusLabel, statusTextField, setStatusButton].forEach({addSubview($0)})
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),

            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 43),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 7),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}



extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
