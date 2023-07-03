//
//  CategoryHeader.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 30.06.2023.
//

import UIKit

final class CategoryHeader: UITableViewHeaderFooterView {
    
    static let reuseId = "CategoryHeader"
    
    private var buttonsArray: [UIButton] = []
    let scrollView = UIScrollView()
    let buttonsStack = UIStackView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        addSubviews()
        addCondtraints()
        
        scrollView.showsHorizontalScrollIndicator = false
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 8
        
        
        createCategoryButtons()
        if let firstButton = buttonsArray.first {
            hightlightTagButton(sender: firstButton)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(buttonsStack)
    }
    
    private func addCondtraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            buttonsStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            buttonsStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            buttonsStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            buttonsStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24),
            buttonsStack.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            buttonsStack.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    private func createCategoryButtons() {
        
        for category in Category.allCases {
            let button = UIButton(type: .roundedRect)
            button.addTarget(self, action: #selector(hightlightTagButton), for: .touchUpInside)
            button.setTitle(category.rawValue, for: .normal)
            button.setTitleColor(#colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 0.4), for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 0.4)
            button.layer.cornerRadius = 15
            button.contentEdgeInsets = .init(top: 8, left: 18, bottom: 8, right: 18)
            
            let index = buttonsStack.arrangedSubviews.endIndex
            buttonsStack.insertArrangedSubview(button, at: index)
            buttonsStack.addArrangedSubview(button)
            buttonsArray.append(button)
        }
        
    }
    
    @objc
    private func hightlightTagButton(sender: UIButton) {
        for button in buttonsArray {
            button.backgroundColor = .clear
            button.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 0.4)
            button.setTitleColor(#colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 0.4), for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            button.layer.borderWidth = 1
        }
        sender.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 0.2)
        sender.setTitleColor(#colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1), for: .normal)
        sender.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        sender.layer.borderWidth = 0
    }
}
