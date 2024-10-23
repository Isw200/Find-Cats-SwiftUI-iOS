//
//  CatDetailView.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-23.
//

import SwiftUI

struct CatDetailView: View {
    @State var selectedCat: BreedDTO
    @StateObject var breedViewModel: BreedsViewViewModel = BreedsViewViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                VStack (alignment: .leading) {
                    Text(selectedCat.name)
                        .font(.system(size: 30,weight: .bold))
                        .padding(.vertical, 10)
                    
                    AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/\( selectedCat.referenceImageID ?? "0XYvRd7oD").jpg")) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        .frame(height: 250)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                    }
                    .frame(height: 250)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .clipShape(.rect(cornerRadius: 25))
                    
                    Text(selectedCat.description ?? "")
                        .padding(.top, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Origin: \(selectedCat.origin ?? "Unknown")")
                            .padding(.bottom, 5)
                        Text("Life Span: \(selectedCat.lifeSpan ?? "Unknown")")
                    }
                    .padding(.vertical, 10)
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                
                    if let temperament = selectedCat.temperament {
                        let temp = temperament.split(separator: ",").map { String($0).trimmingCharacters(in: .whitespaces) }
                        let chipArray: [ChipModel] = temp.map { ChipModel(text: $0) }
                        ChipContainerView(chipArray: chipArray)
                    }
                    
                    
                }
                .padding(.horizontal, 20)
                Spacer()
            }
        }
    }
}

#Preview {
    CatDetailView(selectedCat: dummyBreed)
}
