//
//  CategoryButton.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 03.07.2023.
//

import UIKit

final class CategoryButton: UIButton {
    
    init(with title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        contentEdgeInsets = .init(top: 8, left: 16, bottom: 8, right: 16)
        setNormal()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = rect.height / 2
        clipsToBounds = true
    }
}

extension CategoryButton {
    
    func setNormal() {
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = Appearence.accentTransparent.cgColor
        setTitleColor(Appearence.accentTransparent, for: .normal)
        titleLabel?.font = Appearence.systemRegularFont
    }
    
    func setSelected() {
        backgroundColor = Appearence.categoryBackground
        layer.borderWidth = 0
        setTitleColor(Appearence.accent, for: .normal)
        titleLabel?.font = Appearence.systemBoldFont
    }
}
