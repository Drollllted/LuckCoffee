//
//  Fonts.swift
//  LuckCoffee
//
//  Created by Drolllted on 26.07.2024.
//

import Foundation
import UIKit

enum Fonts: String {
    case SoraBold = "Sora-Bold"
    case SoraExtraBold = "Sora-ExtraBold"
    case SoraExtraLight = "Sora-ExtraLight"
    case SoraLight = "Sora-Light"
    case SoraMedium = "Sora-Medium"
    case SoraRegular = "Sora-Regular"
    case SoraSemiBold = "Sora-SemiBold"
    case SoraThin = "Sora-Thin"
}

extension UIFont{
    static func customFont(type: Fonts, size: CGFloat) -> UIFont?{
        return UIFont(name: type.rawValue, size: size)
    }
}
