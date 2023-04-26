//
//  FormPicker.swift
//  FormEngineSwiftUI
//
//  Created by Jacky Lam on 2023-04-23.
//

import SwiftUI

struct FormPicker: View {
    var titleKey: LocalizedStringKey
    @Binding var selectedId: Int
    var data: [PickerItem]
    var messageKey: LocalizedStringKey

    init(
        titleKey: LocalizedStringKey = "",
        selectedId: Binding<Int>,
        data: [PickerItem],
        messageKey: LocalizedStringKey = ""
    ) {
        self.titleKey = titleKey
        self._selectedId = selectedId
        self.data = data
        self.messageKey = messageKey
    }

    var body: some View {
        FormView(titleKey: titleKey, errorMessageKey: messageKey) {
            Menu(
                content: {
                    Picker("", selection: $selectedId) {
                        Text(" ").tag(-1)  // default
                        ForEach(data, id: \.id) { element in
                            Text(element.value)
                        }
                    }
                },
                label: {
                    Text(data.first(where: { $0.id == selectedId})?.value ?? " ")
                        .frame(maxWidth: .infinity)
                        // text
                        .font(FontStyle.regular.notoSansTC(for: 14))
                        .accentColor(ColorStyle.textPrimary.color)
                        // border
                        .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(ColorStyle.textPrimary.color, style: StrokeStyle(lineWidth: 1))
                        )
                }
            )
        }
    }
}

struct FormPicker_Previews: PreviewProvider {
    static var previews: some View {
        FormPicker(
            titleKey: "Color",
            selectedId: .constant(2),
            data: [
                PickerItem(id: 0, value: "Red"),
                PickerItem(id: 1, value: "Green"),
                PickerItem(id: 2, value: "Blue"),
            ],
            messageKey: ""
        )
        .previewLayout(.sizeThatFits)
    }
}
