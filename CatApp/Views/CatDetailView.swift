import SwiftUI

struct CatDetailView: View {
    @State var selectedCat: BreedDTO
    @StateObject var breedViewModel: BreedsViewViewModel = BreedsViewViewModel()
    @State var isSheetPresented: Bool = false
    @State var url: String = ""
    
    init(selectCat: BreedDTO) {
        _selectedCat = .init(initialValue: selectCat)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(selectedCat.name)
                        .font(.system(size: 30, weight: .bold))
                        .padding(.vertical, 10)
                    
                    AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/\(selectedCat.referenceImageID ?? "0XYvRd7oD").jpg")) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        .frame(height: 250)
                        .background(Color.gray.opacity(0.2))
                    }
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    HStack (alignment: .top) {
                        if (selectedCat.altNames != "")  {
                            HStack{
                                Text(selectedCat.altNames ?? "No alternate names")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundStyle(.secondary)
                                
                                Spacer()
                            }
                        }
                        
                        HStack(alignment: .bottom, spacing: 10) {
                            Text("Energy: ")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.secondary)
                            if let energyLevel = selectedCat.energyLevel {
                                ForEach(0..<Int(energyLevel), id: \.self) { index in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .frame(width: 10)
                                }
                                
                                let remainingStars = 5 - Int(energyLevel)
                                ForEach(0..<remainingStars, id: \.self) { index in
                                    Image(systemName: "star")
                                        .foregroundColor(.yellow)
                                        .frame(width: 10)
                                }
                            }
                        }
                    }
                    .padding(.top, 10)
                    
                    Text(selectedCat.description ?? "")
                        .padding(.top, 4)

                    VStack(alignment: .leading) {
                        Text("Origin: \(selectedCat.origin ?? "Unknown")")
                            .padding(.bottom, 5)
                        Text("Life Span: \(selectedCat.lifeSpan ?? "Unknown")")
                    }
                    .padding(.vertical, 10)
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                    
                    // Chips view
                
                    VStack {
                        if let temperament = selectedCat.temperament {
                            let temp = temperament.split(separator: ",").map { String($0).trimmingCharacters(in: .whitespaces) }
                            let chipArray: [ChipModel] = temp.map { ChipModel(text: $0) }
                            ChipContainerView(chipArray: chipArray)
                        }
                    }
                    .frame(height: CGFloat((selectedCat.temperament?.split(separator: ",").count ?? 0) * 23))

                    // Links to Safari views
                    
                    Text("Want to know more about this cat?")
                    
                    HStack(alignment: .top) {
                        UrlButton(buttonText: "Cfa.org", action: {
                            let cfaURL = selectedCat.cfaURL ?? "https://www.cfa.org"
                            url = cfaURL.hasPrefix("http") ? cfaURL : "https://www.cfa.org"
                            isSheetPresented.toggle()
                        }, icon: "link")
                    }
                    
                    Text("Veterinary Information")
                    
                    HStack(alignment: .top) {
                        UrlButton(buttonText: "VCA Hospitals", action: {
                            let vetURL = selectedCat.vetstreetURL ?? "https://www.vetstreet.com"
                            url = vetURL.hasPrefix("http") ? vetURL : "https://www.vetstreet.com"
                            isSheetPresented.toggle()
                        }, icon: "link", backgroundColor: .green, foregroundColor: Color.green)
                        
                        UrlButton(buttonText: "Vet Street", action: {
                            let vetURL = selectedCat.vetstreetURL ?? "https://www.vetstreet.com"
                            url = vetURL.hasPrefix("http") ? vetURL : "https://www.vetstreet.com"
                            isSheetPresented.toggle()
                        }, icon: "link", backgroundColor: .green, foregroundColor: Color.green)
                    }
                    
                    Divider()
                        .padding(.top, 10)
                     
                    Text("About")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                    
                    // Table
                    
                    TableView(selectedCat: selectedCat)
                    
                }
                .sheet(isPresented: $isSheetPresented) {
                    if let validURL = URL(string: url) {
                        SafariView(url: validURL)
                    } else {
                        VStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .frame(width: 55, height: 50)
                                .font(.title)
                                .foregroundColor(.red.opacity(0.5))
                            Text("Invalid URL")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 20)
                        }
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
            }
        }
    }
}

#Preview {
    CatDetailView(selectCat: dummyBreed)
}
