//
//  BreedsView.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-23.
//

import SwiftUI

struct BreedsView: View {
    @StateObject var breedsViewModel: BreedsViewViewModel = BreedsViewViewModel()
    @Environment(\.isSearching) private var isSearching

    var body: some View {
        
        NavigationStack {
            if breedsViewModel.isLoading {
                VStack {
                    ProgressView()
                }
            } else {
                VStack{
                    if breedsViewModel.isLoading {
                        VStack {
                            ProgressView()
                        }
                    }
                    
                    List(breedsViewModel.breeds, id: \.id) { breed in
                        VStack(alignment: .leading) {
                            BreedRowItem(breed: breed)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                .searchable(text: $breedsViewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
                .navigationTitle("Catpedia 🐈")
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
