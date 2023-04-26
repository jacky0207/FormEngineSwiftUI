//
//  FormTitle.swift
//  FormEngineSwiftUI
//
//  Created by Jacky Lam on 2023-04-23.
//

import SwiftUI

struct FormTitle: View {
    var titleKey: LocalizedStringKey

    init(titleKey: LocalizedStringKey) {
        self.titleKey = titleKey
    }

    var body: some View {
        FormView(
            titleKey: titleKey,
            errorMessageKey: "",
            content: { EmptyView() }
        )
    }
}

struct FormTitle_Previews: PreviewProvider {
    static var previews: some View {
        FormTitle(titleKey: "Title")
            .previewLayout(.sizeThatFits)
    }
}
