//
//  ViewController.swift
//  diceApp
//
//  Created by Nikita Savchik on 20/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let dices = [#imageLiteral(resourceName: "diceOne"), #imageLiteral(resourceName: "diceTwo"), #imageLiteral(resourceName: "diceThree"), #imageLiteral(resourceName: "diceFour"), #imageLiteral(resourceName: "diceFive"), #imageLiteral(resourceName: "diceSix") ]
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "secondBackground")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let diceLogoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "diceLogo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var rollButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Medium", size: 30)
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(rollButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gameAreaView: GameAreaView = {
        let view = GameAreaView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setConstraints()
    }
    
    private func setupUI() {
        setupSubviews(
            backgroundImageView,
            diceLogoImageView,
            gameAreaView,
            rollButton
        )
        
        setupNavBarButton()
    }
    
    private func setupNavBarButton() {
        let settingsButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        settingsButton.setBackgroundImage(UIImage(systemName: "gear"), for: .normal)
        settingsButton.tintColor = .white
        settingsButton.addTarget(self, action: #selector(barButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingsButton)
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            view.addSubview(subview)
        }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            diceLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            diceLogoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            diceLogoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            diceLogoImageView.heightAnchor.constraint(equalToConstant: 150),
            diceLogoImageView.widthAnchor.constraint(equalToConstant: 300),
            
            gameAreaView.topAnchor.constraint(equalTo: diceLogoImageView.bottomAnchor, constant: 80),
            gameAreaView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            gameAreaView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            gameAreaView.heightAnchor.constraint(equalToConstant: 150),
            gameAreaView.widthAnchor.constraint(equalToConstant: 500),
            
            rollButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            rollButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            rollButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            rollButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func rollButtonTapped() {
        gameAreaView.firstDiceImageView.image = dices.randomElement()
        gameAreaView.secondDiceImageView.image = dices.randomElement()
    }
    
    @objc func barButtonTapped() {
        let greetingView = GreetingView(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
        greetingView.center = view.center
        greetingView.onClose = {
            self.navigationItem.rightBarButtonItem?.isHidden = false
        }
        greetingView.showAnimated(on: self)
        
        navigationItem.rightBarButtonItem?.isHidden = true
    }
}

