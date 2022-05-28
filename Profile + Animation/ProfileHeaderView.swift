//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Даниил Сокол on 11.03.2022.
//
import SnapKit
import UIKit
import iOSIntPackage

class ProfileHeaderView : UIViewController, UITableViewDataSource {
    
    let posts = Post.publications()
        
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        var fonNew = UIView()
        fonNew.backgroundColor = .white
        return fonNew
    }()
    
    let fonForAnimation : UIView = {
        let fonTwo = UIView()
        fonTwo.backgroundColor = .white
        fonTwo.alpha = 0.8
        return fonTwo
    }()
    
    let fonTable : UIView = {
        let fonTable = UIView()
        fonTable.backgroundColor = .systemBlue
        return fonTable
    }()
    
    
    let textImage : UILabel = {
        let text = UILabel()
        text.text = "Photos"
        text.tintColor = .black
        text.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return text
    }()
    
    let fotoOne : UIImageView = {
        let foto = UIImageView()
        foto.image = UIImage(named: "1")
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        return foto
    }()
    
    let fotoTwo : UIImageView = {
        let foto = UIImageView()
        foto.image = UIImage(named: "2")
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        return foto
    }()
    
    let fotoThree : UIImageView = {
        let foto = UIImageView()
        foto.image = UIImage(named: "3")
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        return foto
    }()
    
    let fotoFour : UIImageView = {
        let foto = UIImageView()
        foto.image = UIImage(named: "4")
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        return foto
    }()
    
    let rightImage : UIImageView = {
        let foto = UIImageView()
        foto.image = UIImage(named: "full_image")
        return foto
    }()
    let imageProcessor = ImageProcessor()
    var avatarImageView : UIImageView = {
        var avatarImageView = UIImageView()
        avatarImageView.image = UIImage.init(named: "055")
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.cornerRadius = 60
        avatarImageView.clipsToBounds = true
        
        return avatarImageView
    }()
    
    let avatarImageViewFull : UIImageView = {
        let avatarImageViewFull = UIImageView()
        avatarImageViewFull.image = UIImage(named: "055")
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
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let statusLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Waiting for something..."
        return label
    }()
    
    var setStatusButton : UIButton = {
        var button = UIButton(frame: CGRect(x: 100, y: 100, width: 250, height: 75))
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
        krestik.setBackgroundImage(image, for: UIControl.State.normal)
        krestik.addTarget(self, action: #selector(animateStop), for: .touchUpInside)
        return krestik
    }()
    
    private let statusTextField: UITextField = {
        let textField = UITextField()
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
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(fon.snp.bottom).inset(-30)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
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
            
            self.fonForAnimation.snp.makeConstraints { fonForAnimation in
                fonForAnimation.top.equalTo(self.view.snp.top)
                fonForAnimation.bottom.equalTo(self.view.snp.top)
                fonForAnimation.leading.equalTo(self.view.snp.leading)
                fonForAnimation.height.equalTo(self.view.snp.height)
                fonForAnimation.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
                fonForAnimation.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.centerY)
            }
            
            self.avatarImageView.snp.makeConstraints { avatarImageView in
                avatarImageView.top.equalTo(self.view.snp.top).inset(280)
                avatarImageView.left.equalTo(self.fonForAnimation.snp.left)
                avatarImageView.right.equalTo(self.fonForAnimation.snp.right)
                avatarImageView.bottom.equalTo(self.view.snp.bottom).inset(280)
            }
            
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.closeAnimation.snp.makeConstraints { closeAnimation in
                    closeAnimation.top.equalTo(self.fonForAnimation.safeAreaLayoutGuide.snp.top).inset(20)
                    closeAnimation.right.equalTo( self.fonForAnimation.safeAreaLayoutGuide.snp.right).inset(20)
                    closeAnimation.width.equalTo(20)
                    closeAnimation.height.equalTo(20)
                }
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func animateStop() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            
            self.closeAnimation.snp.makeConstraints { closeAnimation in
                closeAnimation.top.equalTo( self.fonForAnimation.snp.top).inset(-80)
                closeAnimation.left.equalTo( self.fonForAnimation.snp.left).inset(-80)
                closeAnimation.width.equalTo(40)
                closeAnimation.height.equalTo(40)
            }

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
        
        fon.snp.makeConstraints({ fon in
            fon.top.equalTo(setStatusButton.safeAreaLayoutGuide.snp.bottom).inset(-20)
            fon.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            fon.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            fon.bottom.equalTo(fotoOne.safeAreaLayoutGuide.snp.bottom).inset(-12)
        })
        
        textImage.snp.makeConstraints({ textImage in
            textImage.top.equalTo(fon.safeAreaLayoutGuide.snp.top).inset(12)
            textImage.left.equalTo(fon.safeAreaLayoutGuide.snp.left).inset(12)
        })
        
        fotoOne.snp.makeConstraints { fotoOne in
            fotoOne.top.equalTo(textImage.safeAreaLayoutGuide.snp.top).inset(40)
            fotoOne.left.equalTo(fon.safeAreaLayoutGuide.snp.left).inset(12)
            fotoOne.width.equalTo(90)
            fotoOne.height.equalTo(70)
            
        }
        
        fotoTwo.snp.makeConstraints({ fotoTwo in
            fotoTwo.top.equalTo( textImage.safeAreaLayoutGuide.snp.top).inset(40)
            fotoTwo.left.equalTo( fotoOne.safeAreaLayoutGuide.snp.right).inset(-12)
            fotoTwo.width.equalTo(90)
            fotoTwo.height.equalTo(70)
        })
        
        fotoThree.snp.makeConstraints({ fotoThree in
            fotoThree.top.equalTo( textImage.safeAreaLayoutGuide.snp.top).inset(40)
            fotoThree.left.equalTo( fotoTwo.safeAreaLayoutGuide.snp.right).inset(-12)
            fotoThree.width.equalTo(90)
            fotoThree.height.equalTo(70)
        })
        
        fotoFour.snp.makeConstraints({ fotoFour in
            fotoFour.top.equalTo( textImage.safeAreaLayoutGuide.snp.top).inset(40)
            fotoFour.left.equalTo( fotoThree.safeAreaLayoutGuide.snp.right).inset(-12)
            fotoFour.width.equalTo(90)
            fotoFour.height.equalTo(70)
        })
        
        rightImage.snp.makeConstraints({ rightImage in
            rightImage.centerY.equalTo( textImage.safeAreaLayoutGuide.snp.centerY)
            rightImage.right.equalTo( fotoFour.safeAreaLayoutGuide.snp.right).inset(12)
            rightImage.width.equalTo(20)
            rightImage.height.equalTo(20)
        })
        
        avatarImageView.snp.makeConstraints({ avatarImageView in
            avatarImageView.top.equalTo( view.safeAreaLayoutGuide.snp.top).inset(16)
            avatarImageView.left.equalTo( view.safeAreaLayoutGuide.snp.left).inset(16)
            avatarImageView.width.equalTo(130)
            avatarImageView.height.equalTo(130)
        })
        
        fullNameLabel.snp.makeConstraints({ fullNameLabel in
            fullNameLabel.top.equalTo( view.safeAreaLayoutGuide.snp.top).inset(27)
            fullNameLabel.leading.equalTo( avatarImageView.snp.trailing).inset(-28)
        })
        
        setStatusButton.snp.makeConstraints({ setStatusButton in
            setStatusButton.top.equalTo( avatarImageView.snp.bottom).inset(-16)
            setStatusButton.leading.equalTo( view.safeAreaLayoutGuide.snp.leading).inset(16)
            setStatusButton.trailing.equalTo( view.safeAreaLayoutGuide.snp.trailing).inset(16)
            setStatusButton.height.equalTo(50)
        })
        
        statusLabel.snp.makeConstraints({ statusLabel in
            statusLabel.left.equalTo(fullNameLabel.snp.left)
            statusLabel.bottom.equalTo( fullNameLabel.snp.bottom).inset(-30)
        })
        
        statusTextField.snp.makeConstraints({ statusTextField in
            statusTextField.left.equalTo( statusLabel.snp.left)
            statusTextField.bottom.equalTo( statusLabel.snp.bottom).inset(-60)
            statusTextField.height.equalTo(38)
            statusTextField.width.equalTo(130)
        })
        
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

