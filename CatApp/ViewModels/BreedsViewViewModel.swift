import Foundation

class BreedsViewViewModel: ObservableObject {
    @Published var breeds: [BreedDTO] = []
    @Published var isLoading: Bool = true
    
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
}
