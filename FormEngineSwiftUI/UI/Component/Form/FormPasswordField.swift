//
//  FormPasswordField.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

import SwiftUI

struct FormPasswordField: View {
    var titleKey: LocalizedStringKey
    var placeholderKey: LocalizedStringKey
    @Binding var text: String
    var messageKey: LocalizedStringKey

    init(
        titleKey: LocalizedStringKey = "",
        placeholderKey: LocalizedStringKey = "",
        text: Binding<String>,
        messageKey: LocalizedStringKey = ""
    ) {
        self.titleKey = titleKey
        self.placeholderKey = placeholderKey
        self._text = text
        self.messageKey = messageKey
    }

    var body: some View {
        FormView(titleKey: titleKey, errorMessageKey: messageKey) {
            SecureField(placeholderKey, text: $text)
                .textFieldStyle(RoundedRectTextFieldStyle())
        }
    }
}

struct FormPasswordField_Previews: PreviewProvider {
    static var previews: some View {
        FormPasswordField(
            titleKey: "Password",
            text: .constant("")
        )
        .previewLayout(.sizeThatFits)
    }
}
