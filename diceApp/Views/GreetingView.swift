//
//  GreetingView.swift
//  diceApp
//
//  Created by Nikita Savchik on 25/10/2023.
//

import UIKit

class GreetingView: UIView {
    
    var onClose: (() -> Void)?
    
    lazy var blurView = UIVisualEffectView()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.03106612526, green: 0.01925105415, blue: 0.006274819374, alpha: 0.66)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "GAME SETTINGS"
        title.font = UIFont(name: "Didot Bold", size: 35)
        title.textColor = .black
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let descriptionLabel: UILabel = {
        let description = UILabel()
        description.text = "Choose game mode:"
        description.font = .rounded(ofSize: 25, weight: .medium)
        description.textColor = .black
        description.textAlignment = .center
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start!", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Medium", size: 30)
        button.layer.cornerRadius = 20
        button.backgroundColor = .clear
        button.layer.borderColor = #colorLiteral(red: 0, green: 0.2558920681, blue: 0.02922244184, alpha: 1)
        button.layer.borderWidth = 2
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gameModeView = GameModeView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addSubview(startButton)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(separator)
        addSubview(gameModeView)
    }
    
    private func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        blurView.effect = blurEffect
    }
}

extension GreetingView {
    func showAnimated(on parentViewController: ViewController) {
        blurView = UIVisualEffectView(frame: parentViewController.view.bounds)
        setupBlurEffect()
        
        parentViewController.view.addSubview(blurView)
        parentViewController.view.addSubview(self)
        
        setupAnimate()
    }
    
    func setupAnimate() {
        alpha = 0
        blurView.alpha = 0
        transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5) {
            self.alpha = 1
            self.blurView.alpha = 1
            self.transform = .identity
        }
    }
    
    func dismissAnimated() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.blurView.alpha = 0
        }) { _ in
            self.removeFromSuperview()
            self.blurView.removeFromSuperview()
            self.onClose?()
        }
    }
    
    @objc func startButtonTapped() {
        dismissAnimated()
    }
}

private extension GreetingView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            separator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            descriptionLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            gameModeView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            gameModeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            gameModeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            gameModeView.heightAnchor.constraint(equalToConstant: 120),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
