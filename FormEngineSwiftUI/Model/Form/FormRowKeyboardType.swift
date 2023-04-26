//
//  FormRowKeyboardType.swift
//  FormEngine
//
//  Created by Jacky Lam on 2023-04-14.
//

import UIKit

public enum FormRowKeyboardType: Int, CaseIterable {
    case `default` = 0
    case number
}

extension FormRow {
    var uiKeyboardType: UIKeyboardType {
        guard let keyboardType = keyboardType,
              let formRowKeyboardType = FormRowKeyboardType(rawValue: keyboardType) else {
            return .default
        }

        switch formRowKeyboardType {
        case .default:
            return .default
        case .number:
            return .numberPad
        }
    }
}

