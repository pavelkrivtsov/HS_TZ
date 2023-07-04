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
        layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 0.4)
        setTitleColor(#colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 0.4), for: .normal)
        titleLabel?.font = .systemFont(ofSize: 13)
    }
    
    func setSelected() {
        backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1).withAlphaComponent(0.4)
        layer.borderWidth = 0
        setTitleColor(.red, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 12)
    }
}
