//
//  TextResultView.swift
//  Ch4-Sawt
//
//  Created by Fatimah Alqarni on 15/06/1446 AH.
//

import SwiftUI

struct TextResultView: View {
    let text: String

    var body: some View {
        ScrollView {
            Text(text.isEmpty ? "No text extracted." : text)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Extracted Text")
    }
}

