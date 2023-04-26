//
//  ViewStyle+Button.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

import SwiftUI

struct FilledButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // text
            .font(FontStyle.medium.notoSansTC(for: 16))
            .foregroundColor(Color.white)
            // background
            .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
            .background(isEnabled ? (configuration.isPressed ? ColorStyle.primaryHighlighted.color : ColorStyle.primary.color) : ColorStyle.primaryDisabled.color)
            .cornerRadius(10)
    }
}

struct RoundedRectButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // text
            .font(FontStyle.medium.notoSansTC(for: 16))
            .foregroundColor(isEnabled ? (configuration.isPressed ? ColorStyle.primaryHighlighted.color : ColorStyle.primary.color) : ColorStyle.primaryDisabled.color)
            // border
            .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(isEnabled ? (configuration.isPressed ? ColorStyle.primaryHighlighted.color : ColorStyle.primary.color) : ColorStyle.primaryDisabled.color, lineWidth: 1.5)
            )
    }
}
