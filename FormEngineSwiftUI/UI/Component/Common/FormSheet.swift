//
//  FormSheet.swift
//  FirstSwiftUI
//
//  Created by Jacky Lam on 2023-03-26.
//

import SwiftUI

struct FormSheet<Content: View>: View {
    var submitTitleKey: LocalizedStringKey
    var submit: () -> Void
    var submitDisabled: Bool
    var content: () -> Content

    init(
        submitTitleKey: LocalizedStringKey = "Submit",
        submit: @escaping () -> Void,
        submitDisabled: Bool = false,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.submitTitleKey = submitTitleKey
        self.submit = submit
        self.submitDisabled = submitDisabled
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
            FormButton(
                titleKey: submitTitleKey,
                action: submit
            )
            .disabled(submitDisabled)
        }
    }
}

struct FormSheet_Previews: PreviewProvider {
    static var previews: some View {
        FormSheet(submit: {}) {
            FormTextField(
                titleKey: "Last Name",
                text: .constant("")
            )
            FormTextField(
                titleKey: "First Name",
                text: .constant("")
            )
            FormTextField(
                titleKey: "Nick Name",
                text: .constant("")
            )
        }
    }
}
