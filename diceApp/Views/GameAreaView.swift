//
//  GameAreaView.swift
//  diceApp
//
//  Created by Nikita Savchik on 25/10/2023.
//

import UIKit

class GameAreaView: UIView {
    
    let firstDiceImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "diceOne")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let secondDiceImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "diceTwo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        backgroundColor = .clear
        setupSubviews(
            firstDiceImageView,
            secondDiceImageView
        )
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            addSubview(subview)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            firstDiceImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            firstDiceImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            firstDiceImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            firstDiceImageView.heightAnchor.constraint(equalToConstant: 100),
            firstDiceImageView.widthAnchor.constraint(equalToConstant: 100),
            
            secondDiceImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            secondDiceImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            secondDiceImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            secondDiceImageView.heightAnchor.constraint(equalToConstant: 100),
            secondDiceImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
