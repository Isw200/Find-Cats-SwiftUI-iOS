//
//  BreedsView.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-23.
//

import SwiftUI

struct BreedsView: View {
    @StateObject var breedsViewModel: BreedsViewViewModel = BreedsViewViewModel()
    
    var body: some View {
        
        NavigationStack {
            if breedsViewModel.isLoading {
                VStack {
                    ProgressView()
                }
            } else {
                List(breedsViewModel.breeds, id: \.id) { breed in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: CatDetailView(selectedCat: breed)) {
                            BreedRowItem(breed: breed)
                        }
                    }
                }
                .navigationTitle("Cats")
            }
        }
        .onAppear{
            Task{
                await breedsViewModel.fetchBreeds()
            }
        }
    }
}

#Preview {
    BreedsView()
}
