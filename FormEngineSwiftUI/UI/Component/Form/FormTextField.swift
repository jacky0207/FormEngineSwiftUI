//
//  FormTextField.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

import SwiftUI

struct FormTextField: View {
    var titleKey: LocalizedStringKey
    var placeholderKey: LocalizedStringKey
    var keyboardType: UIKeyboardType
    @Binding var text: String
    var messageKey: LocalizedStringKey

    init(
        titleKey: LocalizedStringKey = "",
        placeholderKey: LocalizedStringKey = "",
        keyboardType: UIKeyboardType = .default,
        text: Binding<String>,
        messageKey: LocalizedStringKey = ""
    ) {
        self.titleKey = titleKey
        self.placeholderKey = placeholderKey
        self.keyboardType = keyboardType
        self._text = text
        self.messageKey = messageKey
    }

    var body: some View {
        FormView(titleKey: titleKey, errorMessageKey: messageKey) {
            TextField(placeholderKey, text: $text)
                .textFieldStyle(RoundedRectTextFieldStyle())
                .keyboardType(keyboardType)
        }
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField(
            titleKey: "Last Name",
            placeholderKey: "e.g. Tai Man",
            text: .constant(""),
            messageKey: "Please enter \"Tai Man\" for \"Chan Tai Man\""
        )
        .previewLayout(.sizeThatFits)
    }
}
