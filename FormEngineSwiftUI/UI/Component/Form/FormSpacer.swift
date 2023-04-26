//
//  FormSpacer.swift
//  FormEngineSwiftUI
//
//  Created by Jacky Lam on 2023-04-23.
//

import SwiftUI

struct FormSpacer: View {
    var body: some View {
        Spacer().frame(height: 12)
    }
}

struct FormSpacer_Previews: PreviewProvider {
    static var previews: some View {
        FormSpacer()
            .previewLayout(.sizeThatFits)
    }
}
