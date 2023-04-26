//
//  FontStyle+NotoSansTC.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

import SwiftUI

extension FontStyle {
    func notoSansTC(for size: CGFloat) -> Font {
        switch self {
        case .regular:
            return Font.custom("NotoSansTC-Regular", size: size)
        case .medium:
            return Font.custom("NotoSansTC-Medium", size: size)
        case .bold:
            return Font.custom("NotoSansTC-Bold", size: size)
        }
    }
}
