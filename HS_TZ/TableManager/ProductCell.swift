//
//  ProductCell.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 29.06.2023.
//

import UIKit
import Kingfisher

final class ProductCell: UITableViewCell {
    
    static let reuseId = "ProductCell"
    private let productImageView = UIImageView()
    private let productLabel = UILabel()
    private let productDescriptionLabel = UILabel()
    private let priceButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
        
        productImageView.contentMode = .scaleAspectFit
        productImageView.layer.cornerRadius = 6
        productImageView.clipsToBounds = true
        
        productLabel.font = Appearence.systemSemiboldFont
        productLabel.numberOfLines = 0
        productLabel.textColor = Appearence.mainText
        
        productDescriptionLabel.font = Appearence.systemRegularFont
        productDescriptionLabel.numberOfLines = 0
        productDescriptionLabel.textColor = Appearence.secondaryText
        
        priceButton.titleLabel?.font = Appearence.systemRegularFont
        priceButton.setTitleColor(Appearence.accent, for: .normal)
        priceButton.contentEdgeInsets = .init(top: 8, left: 18, bottom: 8, right: 18)
        priceButton.layer.borderColor = Appearence.accent.cgColor
        priceButton.layer.cornerRadius = 6
        priceButton.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(productLabel)
        contentView.addSubview(productDescriptionLabel)
        contentView.addSubview(priceButton)
    }
    
    private func addConstraints() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productLabel.translatesAutoresizingMaskIntoConstraints = false
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImageView.widthAnchor.constraint(equalToConstant: 132),
            productImageView.heightAnchor.constraint(equalToConstant: 132),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            productImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            
            productLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            productLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 180),
            productLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            productDescriptionLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 8),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 180),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            priceButton.heightAnchor.constraint(equalToConstant: 32),
            priceButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 87),
            priceButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            priceButton.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 16),
            priceButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
        ])
    }

}

extension ProductCell {
    
    func configure(_ dataModel: DataModel, firstCell: Bool) {
        
        if firstCell == true {
            layer.cornerRadius = 20
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            clipsToBounds = true
        } else {
            layer.cornerRadius = 0
        }

        guard let url = URL(string: dataModel.image) else {
            return
        }
        productImageView.kf.setImage(with: url)
        productLabel.text = dataModel.title
        productDescriptionLabel.text = dataModel.description
        priceButton.setTitle("from \(dataModel.price) $", for: .normal)
    }
}
