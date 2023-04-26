//
//  FormGeneratorStorage.swift
//  FormEngineSwiftUI
//
//  Created by Jacky Lam on 2023-04-26.
//

import SwiftUI

class FormGeneratorStorageBinding {
    static let shared = FormGeneratorStorageBinding()

    private init() {}

    func stringBinding(for row: FormRow, from values: [String: Any], action: @escaping (String) -> Void) -> Binding<String>? {
        guard let type = FormRowType(rawValue: row.type) else {
            return nil
        }
        if type.bindingType != .string {
            return nil
        }
        return Binding(
            get: { String(describing: values[row.id, default: ""]) },
            set: action
        )
    }

    func intBinding(for row: FormRow, from values: [String: Any], action: @escaping (Int) -> Void) -> Binding<Int>? {
        guard let type = FormRowType(rawValue: row.type) else {
            return nil
        }
        if type.bindingType != .int {
            return nil
        }
        return Binding(
            get: { values[row.id, default: -1] as! Int },
            set: action
        )
    }
}
