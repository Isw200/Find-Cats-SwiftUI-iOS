//
//  UrlButton.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-23.
//

import SwiftUI

struct UrlButton: View {
    var buttonText: String
    var action: () -> Void
    var icon: String?
    var backgroundColor: Color = .accentColor
    var foregroundColor: Color = .accentColor
    
    var body: some View {
        Button  {
            
        } label: {
            Image(systemName: icon ?? "link")
                .foregroundColor(foregroundColor)
            Button(action: action) {
                Text(buttonText)
            }
        }
        .foregroundStyle(foregroundColor)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(backgroundColor.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    UrlButton(buttonText: "Button", action: {})
}
