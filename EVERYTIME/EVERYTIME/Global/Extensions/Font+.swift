//
//  Font+.swift
//  EVERYTIME
//
//  Created by sieon on 11/7/26.
//

import SwiftUI

enum PretendardWeight: String, CaseIterable {
    case thin       = "Pretendard-Thin"
    case extraLight = "Pretendard-ExtraLight"
    case light      = "Pretendard-Light"
    case regular    = "Pretendard-Regular"
    case medium     = "Pretendard-Medium"
    case semiBold   = "Pretendard-SemiBold"
    case bold       = "Pretendard-Bold"
    case extraBold  = "Pretendard-ExtraBold"
    case black      = "Pretendard-Black"
}

extension Font {
    static func pretendard(_ weight: PretendardWeight, size: CGFloat) -> Font {
        .custom(weight.rawValue, size: size)
    }
}

extension Font {
    static let head1 = pretendard(.semiBold, size: 17)
    
    static let subhead1 = pretendard(.bold, size: 14)
    static let subhead2 = pretendard(.semiBold, size: 12)
    
    static let body1 = pretendard(.semiBold, size: 20)
    static let body2 = pretendard(.bold, size: 14)
    static let body3 = pretendard(.regular, size: 14)
    static let body4 = pretendard(.semiBold, size: 12)
 
    static let cap1 = pretendard(.regular, size: 12)
    static let cap2 = pretendard(.medium, size: 11)
    static let cap3 = pretendard(.regular, size: 11)
    static let cap4 = pretendard(.medium, size: 10)
    static let cap5 = pretendard(.regular, size: 10)
}
