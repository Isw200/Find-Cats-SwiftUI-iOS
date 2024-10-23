//
//  ChipView.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-23.
//

import SwiftUI

struct ChipView: View {
    @State var text: String = "Unknown"
    
    var body: some View {
        HStack(spacing: 4) {
            Text(text).font(.system(size: 15, weight: .semibold)).lineLimit(1)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .foregroundStyle(.black.opacity(0.6))
        .background(Color.gray.opacity(0.4))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.0), lineWidth: 1.5)
            
        )
    }
}

#Preview {
    ChipView()
}
