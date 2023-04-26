//
//  FormRowType+Binding.swift
//  FormEngineSwiftUI
//
//  Created by Jacky Lam on 2023-04-23.
//

extension FormRowType {
    enum BindingType: CaseIterable {
        case string, int
    }

    var bindingType: BindingType {
        switch self {
        case .picker:
            return .int
        default:
            return .string
        }
    }
}
