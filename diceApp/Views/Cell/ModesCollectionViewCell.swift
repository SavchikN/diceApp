//
//  ModesCollectionViewCell.swift
//  diceApp
//
//  Created by Nikita Savchik on 25/10/2023.
//

import UIKit

class ModesCollectionViewCell: UICollectionViewCell {
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .rounded(ofSize: 24, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                typeImage.tintColor = .black
                typeLabel.textColor = .black
            } else {
                typeImage.tintColor = .systemGray
                typeLabel.textColor = .systemGray
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.borderWidth = 0
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.cornerRadius = 20
        backgroundColor = .clear
        
        addSubview(typeLabel)
        addSubview(typeImage)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            typeImage.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            typeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            typeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            typeImage.heightAnchor.constraint(equalToConstant: 60),
            typeImage.widthAnchor.constraint(equalToConstant: 60),
            
            typeLabel.topAnchor.constraint(equalTo: typeImage.bottomAnchor, constant: 10),
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            typeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}

