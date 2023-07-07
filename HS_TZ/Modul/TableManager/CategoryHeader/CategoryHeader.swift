//
//  CategoryHeader.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 30.06.2023.
//

import UIKit

final class CategoryHeader: UIView {
    
    static let reuseId = "CategoryHeader"
    let scrollView = UIScrollView()
    let buttonsStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Appearence.background

        addSubviews()
        addCondtraints()
        addButtons()

        scrollView.showsHorizontalScrollIndicator = false
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 8

        if let firstButton = buttonsStack.arrangedSubviews.first as? CategoryButton {
            selectButton(button: firstButton)
        }
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
            buttonsStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            buttonsStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24),
            buttonsStack.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
        ])
    }
    
    private func addButtons() {
        for category in Category.allCases {
            let button = CategoryButton(with: category.rawValue)
            buttonsStack.addArrangedSubview(button)
        }
    }
}

extension CategoryHeader {
    
    func selectButton(button: CategoryButton) {
        guard let buttons = buttonsStack.arrangedSubviews as? [CategoryButton] else { return }
        buttons.forEach { $0.setNormal() }
        button.setSelected()
    }
}
