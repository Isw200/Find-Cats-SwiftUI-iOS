//
//  LevelView.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-24.
//

import SwiftUI

struct LevelView: View {
    @State var level: Int?
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 5) {
            if let lvl = level {
                ForEach(0..<Int(lvl), id: \.self) { index in
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.green)
                }
                
                let remainingStars = 5 - Int(lvl)
                ForEach(0..<remainingStars, id: \.self) { index in
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.green)
                }
            }
        }
    }
}

#Preview {
    LevelView(level: 4)
}
