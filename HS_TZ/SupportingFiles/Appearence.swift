//
//  Appearence.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 04.07.2023.
//

import UIKit

enum Appearence {
    static let mainText = #colorLiteral(red: 0.1333333333, green: 0.1568627451, blue: 0.1921568627, alpha: 1)
    static let secondaryText = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6784313725, alpha: 1)
    static let background = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9764705882, alpha: 1)
    static let accent = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1)
    static let categoryBackground = accent.withAlphaComponent(0.2)
    static let accentTransparent = accent.withAlphaComponent(0.4)
    
    static let systemRegularFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    static let systemBoldFont = UIFont.systemFont(ofSize: 13, weight: .bold)
    static let systemSemiboldFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
    static let systemMediumFont = UIFont.systemFont(ofSize: 17, weight: .medium)
}
