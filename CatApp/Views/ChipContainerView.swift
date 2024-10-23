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
        var width = CGFloat.zero
        var height = CGFloat.zero
        return GeometryReader { geo in
            ZStack(alignment: .topLeading, content: {
                ForEach(chipArray) { data in
                    ChipView(text: data.text)
                        .padding(.all, 5)
                        .alignmentGuide(.leading) { dimension in
                            if (abs(width - dimension.width) > geo.size.width) {
                                width = 0
                                height -= dimension.height
                            }
                            let result = width
                            if data.id == chipArray.last!.id {
                                width = 0
                            } else {
                                width -= dimension.width
                            }
                            return result
                        }
                        .alignmentGuide(.top) { dimension in
                            let result = height
                            if data.id == chipArray.last!.id {
                                height = 0
                            }
                            return result
                        }
                }
            })
        }
    }
}

struct ChipContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ChipContainerView()
    }
}
