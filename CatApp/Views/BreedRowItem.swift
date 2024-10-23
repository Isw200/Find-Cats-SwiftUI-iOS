//
//  BreedRowItem.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-23.
//

import SwiftUI

struct BreedRowItem: View {
    @State var breed: BreedDTO
    var temperaments : [String] = []
    
    var body: some View {
        HStack (alignment: .top)
        {
            AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/\( breed.referenceImageID ?? "0XYvRd7oD").jpg")) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                if (breed.referenceImageID == nil) {
                    HStack {
                        Spacer()
                        Text("No Image")
                        Spacer()
                    }
                    .frame(width: 120, height: 120)
                    .background(Color.gray.opacity(0.2))
                } else {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    .frame(width: 120, height: 120)
                    .background(Color.gray.opacity(0.2))
                }
            }
            .frame(width: 120, height: 120)
            .clipShape(.rect(cornerRadius: 25))
            VStack(alignment: .leading) {
                Text(breed.name)
                    .font(.headline)
                HStack {
                    Image(systemName: "map.fill")
                    Text(breed.origin ?? "Unknown")
                }
                .padding(EdgeInsets.init(top: 0.5, leading: 0, bottom: 3, trailing: 0))
                Text(breed.temperament ?? "N/A")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    BreedsView()
}
