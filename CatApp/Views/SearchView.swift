//
//  SearchView.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchViewModel: SearchViewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            if searchViewModel.breeds.isEmpty {
                Color.clear
                    .frame(height: 0)
            } else {
                List(searchViewModel.breeds, id: \.id) { breed in
                    VStack {
                        Text(breed.name)
                            .font(.headline)
                    }
                }
                .listStyle(.plain)
            }
        }
        
    }
}

#Preview {
    SearchView()
}
