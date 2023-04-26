//
//  FormGeneratorSheet.swift
//  FormEngineSwiftUI
//
//  Created by Jacky Lam on 2023-04-23.
//

import SwiftUI

protocol FormGenerator {
    var form: Form { get set }
    var validator: FormGeneratorValidator { get set }
    func completeForm(for row: FormRow)

    var values: [String: Any] { get set }
    func updateStringValue(_ value: String, for row: FormRow) -> Void
    func updateIntValue(_ value: Int, for row: FormRow) -> Void
}

extension FormGeneratorSheet {
    struct CompletionParams {
        var action: FormRowAction
        var values: [String: Any]
    }
}

struct FormGeneratorSheet: View, FormGenerator {
    var form: Form
    @State var values: [String : Any] = [:]
    @ObservedObject var validator: FormGeneratorValidator = FormGeneratorValidator()
    var completion: (CompletionParams) -> Void

    init(
        form: Form,
        values: [String: Any] = [:],
        completion: @escaping (CompletionParams) -> Void
    ) {
        self.form = form
        self.values = values
        self.completion = completion
    }

    var body: some View {
        List {
            ForEach(form.rows, id: \.self) { row in
                FormGeneratorRow(
                    row,
                    stringValue: FormGeneratorStorageBinding.shared.stringBinding(
                        for: row,
                        from: values,
                        action: { updateStringValue($0, for: row) }
                    ),
                    intValue: FormGeneratorStorageBinding.shared.intBinding(
                        for: row,
                        from: values,
                        action: { updateIntValue($0, for: row) }
                    ),
                    errorMessage: validator.errorMessages[row.id] ?? "",
                    completion: completeForm
                )
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
            }
        }
        .background(Color.clear)
        .listStyle(PlainListStyle())
    }

    func updateStringValue(_ value: String, for row: FormRow) {
        let keyboardType = FormRowKeyboardType(rawValue: row.keyboardType ?? -1) ?? .default
        if value.isEmpty {
            values[row.id] = nil
        } else {
            values[row.id] = keyboardType == .number ? Int(value) : value
        }
        validator.errorMessages[row.id] = nil
        FormGeneratorLogger.shared.log(row, with: value)
    }

    func updateIntValue(_ value: Int, for row: FormRow) {
        values[row.id] = value < 0 ? nil : value
        validator.errorMessages[row.id] = nil
        FormGeneratorLogger.shared.log(row, with: value)
    }

    func completeForm(for row: FormRow) {
        let action = FormRowAction(rawValue: row.action ?? -1) ?? .submit
        FormGeneratorLogger.shared.log(row, forAction: action)
        FormGeneratorLogger.shared.log("values: \(values)")
        validator.validateForm(form, with: values)
        if !validator.errorMessages.isEmpty {
            for error in validator.errorMessages {
                FormGeneratorLogger.shared.log(id: error.key, forError: error.value)
            }
            return
        }
        FormGeneratorLogger.shared.log("submit form")
        completion(CompletionParams(action: action, values: values))
    }
}

fileprivate struct FormGeneratorRow: View {
    var row: FormRow
    @Binding var stringValue: String
    @Binding var intValue: Int
    var errorMessage: String
    var completion: (FormRow) -> Void

    init(
        _ row: FormRow,
        stringValue: Binding<String>?,
        intValue: Binding<Int>?,
        errorMessage: String,
        completion: @escaping (FormRow) -> Void
    ) {
        self.row = row
        self._stringValue = stringValue ?? .constant("")
        self._intValue = intValue ?? .constant(-1)
        self.errorMessage = errorMessage
        self.completion = completion
    }

    var body: some View {
        guard let type = FormRowType(rawValue: row.type) else {
            return AnyView(FormSpacer())
        }
        switch type {
        case .title:
            return AnyView(FormTitle(
                titleKey: LocalizedStringKey(row.title ?? "")
            ))
        case .button:
            return AnyView(FormButton(
                titleKey: LocalizedStringKey(row.title ?? ""),
                action: { completion(row) }
            ))
        case .textField:
            return AnyView(FormTextField(
                titleKey: LocalizedStringKey(row.title ?? ""),
                keyboardType: row.uiKeyboardType,
                text: $stringValue,
                messageKey: LocalizedStringKey(errorMessage)
            ))
        case .picker:
            return AnyView(FormPicker(
                titleKey: LocalizedStringKey(row.title ?? ""),
                selectedId: $intValue,
                data: row.items ?? [],
                messageKey: LocalizedStringKey(errorMessage)
            ))
        case .passwordField:
            return AnyView(FormPasswordField(
                titleKey: LocalizedStringKey(row.title ?? ""),
                text: $stringValue,
                messageKey: LocalizedStringKey(errorMessage)
            ))
        }
    }
}

struct FormGeneratorSheet_Previews: PreviewProvider {
    static var previews: some View {
        FormGeneratorSheet(form: ModelData().form) { action in

        }
    }
}
