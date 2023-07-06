//
//  BannerHeader.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 06.07.2023.
//

import UIKit

final class BannerHeader: UIView {
    
    private let images = ["promo1","promo2"]
    private let scrollView = UIScrollView()
    private let buttonsStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Appearence.background
        
        addSubviews()
        addCondtraints()
        addButtons()
        
        scrollView.showsHorizontalScrollIndicator = false
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(buttonsStack)
    }
    
    private func addCondtraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            buttonsStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            buttonsStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            buttonsStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            buttonsStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            buttonsStack.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
        ])
    }
    
    private func addButtons() {
        for image in images {
            let button = UIButton(type: .custom)
            button.setImage(.init(named: image), for: .normal)
            buttonsStack.addArrangedSubview(button)
        }
    }
}
