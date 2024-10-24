import Foundation

class BreedsViewViewModel: ObservableObject {
    @Published var breeds: [BreedDTO] = []
    @Published var isLoading: Bool = true
    @Published var isLoadingSearch: Bool = false
    @Published var searchText: String = "" {
        didSet {
            if (searchText.count > 0) {
                Task {
                    await searchBreeds(keyword: searchText)
                }
            } else {
                Task {
                    await fetchBreeds()
                }
            }
        }
    }
    
    func fetchBreeds() async {
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        
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
    
    func searchBreeds(keyword: String) async {
        DispatchQueue.main.async {
            self.isLoadingSearch = true
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
                        self.isLoadingSearch = false
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
