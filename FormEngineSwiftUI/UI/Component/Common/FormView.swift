//
//  FormView.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

import SwiftUI

struct FormView<Content: View>: View {
    var titleKey: LocalizedStringKey
    var errorMessageKey: LocalizedStringKey
    var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            FormHeaderView(titleKey: titleKey)
            content()
            FormFooterView(errorMessageKey: errorMessageKey)
        }        
    }
}

fileprivate struct FormHeaderView: View {
    var titleKey: LocalizedStringKey

    var body: some View {
        if titleKey == "" {
            EmptyView()
        } else {
            FormTitleView(titleKey)
            Spacer().frame(height: 2)
        }
    }
}

fileprivate struct FormTitleView: View {
    var key: LocalizedStringKey

    init(_ key: LocalizedStringKey) {
        self.key = key
    }

    var body: some View {
        Text(key)
            .font(FontStyle.regular.notoSansTC(for: 16))
            .foregroundColor(ColorStyle.textPrimary.color)
    }
}

fileprivate struct FormFooterView: View {
    var errorMessageKey: LocalizedStringKey

    var body: some View {
        if errorMessageKey == "" {
           EmptyView()
        } else {
            Spacer().frame(height: 2)
            FormMessageView(errorMessageKey)
        }
    }
}

fileprivate struct FormMessageView: View {
    var key: LocalizedStringKey

    init(_ key: LocalizedStringKey) {
        self.key = key
    }

    var body: some View {
        Text(key)
            .font(FontStyle.regular.notoSansTC(for: 14))
            .foregroundColor(ColorStyle.errorMessagePrimary.color)
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FormView(titleKey: "Last Name", errorMessageKey: "e.g. Tai Man") {
                TextField("", text: .constant("Alvin"))
            }

            FormTitleView("Last Name")
                .previewDisplayName("Title")

            FormMessageView("e.g. Tai Man")
                .previewDisplayName("Message")
        }
        .previewLayout(.sizeThatFits)
    }
}
