//
//  LogInViewController.swift
//  Navigation
//
//  Created by Даниил Сокол on 19.03.2022.
//

import UIKit

class LogInViewController : UIViewController {
        
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false // Отключаем "оттяжку" экрана(скролВью)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let logoVKImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let infoLoginTextField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.tintColor = .black
        login.layer.borderWidth = 0.5
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.cornerRadius = 10
        login.backgroundColor = .systemGray6
        login.textAlignment = .left
        login.placeholder = "Email or number"
        // - !
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: login.frame.height)) //создали прозрачную вьюшку с отступом 15 поинтов при вводе текста, соответственно удалил пробелы в login.placeholder = "   Email or number"
        login.leftViewMode = .always
        login.clearButtonMode = .always // слева появляется кнопка Х, для удаления шрифта
        login.returnKeyType = .done  // кнопка DONE /готово в клавиатуре
        return login
    }()
    
    private let infoPasswordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.tintColor = .black
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.cornerRadius = 10
        password.backgroundColor = .systemGray6
        password.textAlignment = .left
        password.placeholder = "Password"
        password.clipsToBounds = true
        password.isSecureTextEntry = true
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: password.frame.height))
        password.leftViewMode = .always
        password.clearButtonMode = .always
        password.returnKeyType = .done
        return password
    }()
    
    public lazy var loginButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonPress), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(scrollView)

        scrollView.addSubview(logoVKImageView)
        scrollView.addSubview(infoLoginTextField)
        scrollView.addSubview(infoPasswordTextField)
        scrollView.addSubview(loginButton)
        
        infoLoginTextField.delegate = self
        infoPasswordTextField.delegate = self
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            logoVKImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoVKImageView.centerXAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.centerXAnchor),
            logoVKImageView.widthAnchor.constraint(equalToConstant: 100),
            logoVKImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            infoLoginTextField.topAnchor.constraint(equalTo: logoVKImageView.bottomAnchor, constant: 120),
            infoLoginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoLoginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoLoginTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            infoPasswordTextField.topAnchor.constraint(equalTo: infoLoginTextField.bottomAnchor, constant: 0),
            infoPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: infoPasswordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -200)
        ])
    }
    
    @objc func loginButtonPress() {
        let profileVC = ProfileHeaderView()
        profileVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
//MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate { // расширяем класс и создаем метод, чтоб закрывалась клава при нажатии на done/готово
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
