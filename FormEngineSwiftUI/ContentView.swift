//
//  ContentView.swift
//  FormEngineSwiftUI
//
//  Created by Jacky Lam on 2023-04-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FormGeneratorSheet(
            form: ModelData().form,
            values: [
                "first_name": "Jacky",
                "age": 18,
            ],
            completion: completion
        )
    }

    func completion(_ params: FormGeneratorSheet.CompletionParams) {
        print("action: \(params.action)")
        print("values: \(params.values)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
