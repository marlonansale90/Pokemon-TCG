//
//  SearchCardCollectionCell.swift
//  PokemoniOS
//
//  Created by Marlon Von Bernales Ansale on 07/03/2023.
//

import UIKit

public class SearchCardCollectionCell: UICollectionViewCell {
    
    public private(set) var containerStack: UIStackView = {
        let containerStack = UIStackView()
        containerStack.axis = .vertical
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        containerStack.alignment = .center
        return containerStack
    }()
    
    public private(set) var cardImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .cellImageViewBackground
        return imageView
    }()
    
    public private(set) var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 14.0, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    public private(set) var boosterSetLabel: UILabel = {
        let boosterSetLabel = UILabel()
        boosterSetLabel.numberOfLines = 0
        boosterSetLabel.textAlignment = .center
        boosterSetLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        boosterSetLabel.translatesAutoresizingMaskIntoConstraints = false
        return boosterSetLabel
    }()
    
    public private(set) var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.numberOfLines = 0
        priceLabel.textAlignment = .center
        priceLabel.font = .systemFont(ofSize: 12.0, weight: .light)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupAutoLayout()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(containerStack)
        containerStack.addArrangedSubview(cardImageView)
        containerStack.addArrangedSubview(titleLabel)
        containerStack.addArrangedSubview(boosterSetLabel)
        containerStack.addArrangedSubview(priceLabel)
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            containerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            containerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            containerStack.topAnchor.constraint(equalTo: topAnchor, constant: 4).withPriority(999),
            containerStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).withPriority(999),
            
            cardImageView.heightAnchor.constraint(equalToConstant: 130),
            cardImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            cardImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
        ])
    }
}
