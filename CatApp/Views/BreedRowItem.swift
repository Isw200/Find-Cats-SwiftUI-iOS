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
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            HStack (alignment: .top)
            {
                AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/\( breed.referenceImageID ?? "0XYvRd7oD").jpg"))
                { image in
                    image.resizable()
                        .scaledToFill()
                }
                placeholder: {
                    if (breed.referenceImageID == nil) {
                        HStack {
                            Spacer()
                            Text("No Image")
                            Spacer()
                        }
                        .frame(width: 100, height: 80)
                        .background(Color.gray.opacity(0.2))
                    }
                    else {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        .frame(width: 100, height: 80)
                        .background(Color.gray.opacity(0.2))
                    }
                }
                .frame(width: 100, height: 80)
                .clipShape(.rect(cornerRadius: 15))
                
                
                HStack (alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(breed.name)
                            .font(.headline)
                        Text(breed.temperament ?? "N/A")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Button {
                        isExpanded.toggle()
                    } label: {
                        VStack {
                            isExpanded ? Image(systemName: "chevron.up") : Image(systemName: "chevron.down")
                        }
                    }
                    .frame(width: 20, height: 20)
                    .tint(.green)
                }
            }
            .onTapGesture {
                isExpanded.toggle()
            }
            
            if isExpanded {
                VStack {
                    Text(breed.description ?? "N/A")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    NavigationLink(destination: CatDetailView(selectCat: breed)) {
                        Text("View Details")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black.opacity(0.8))
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.green.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

#Preview {
    BreedsView()
}
