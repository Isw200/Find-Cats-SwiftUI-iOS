//
//  ChipContainerView.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-23.
//

import SwiftUI

struct ChipContainerView: View {
    @State var chipArray: [ChipModel] = []
    
    var body: some View {
        var horizontalPosition: CGFloat = CGFloat.zero
        var verticalPosition: CGFloat = CGFloat.zero
        
        return GeometryReader { geo in
            ZStack(alignment: .topLeading, content: {
                ForEach(chipArray) { data in
                    ChipView(text: data.text)
                        .padding(.all, 5)
                        .alignmentGuide(.leading) { dimension in
                            if (abs(horizontalPosition - dimension.width) > geo.size.width) {
                                horizontalPosition = 0
                                verticalPosition -= dimension.height
                            }
                            let result = horizontalPosition
                            
                            if data.id == chipArray.last!.id {
                                horizontalPosition = 0
                            } else {
                                horizontalPosition -= dimension.width
                            }
                            
                            return result
                        }
                        .alignmentGuide(.top) { dimension in
                            let result = verticalPosition
                            if data.id == chipArray.last!.id {
                                verticalPosition = 0
                            }
                            return result
                        }
                }
            })
        }
    }
}

#Preview {
    ChipContainerView()
}
