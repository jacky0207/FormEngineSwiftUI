//
//  ViewStyle+TextField.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

import SwiftUI

struct RoundedRectTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            // text
            .font(FontStyle.regular.notoSansTC(for: 14))
            .foregroundColor(ColorStyle.textPrimary.color)
            // border
            .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(ColorStyle.textPrimary.color, style: StrokeStyle(lineWidth: 1))
            )
    }
}
