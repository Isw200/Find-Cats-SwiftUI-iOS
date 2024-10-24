//
//  SearchViewModel.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-24.
//

import Foundation
import SwiftUICore

@MainActor
class SearchViewModel: ObservableObject {
    @Published var breeds: [BreedDTO] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = "" {
        didSet {
            if (searchText.count > 0) {
                Task {
                    await fetchBreeds(keyword: searchText)
                }
            } else {
                breeds.removeAll()
            }
        }
    }

    
    func fetchBreeds(keyword: String) async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds/search?q=\(keyword)")
        
        guard let unwrappedUrl = url else { return }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: unwrappedUrl)
            
            guard let response = response as? HTTPURLResponse else {
                print("Something went wrong")
                return
            }
            
            switch response.statusCode {
                case 200...300:
                    let breedsData = try JSONDecoder().decode([BreedDTO].self, from: data)
                    DispatchQueue.main.async {
                        self.breeds = breedsData
                        self.isLoading = false
                    }
                    print("Breeds fetched successfully")
                case 400...500:
                    print("Server error")
                default:
                    print("Unknown error")
            }
        } catch {
            print("Error fetching breeds: \(error)")
        }
    }
}
