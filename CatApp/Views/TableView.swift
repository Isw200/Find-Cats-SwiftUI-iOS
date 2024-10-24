//
//  TableView.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-24.
//

import SwiftUI

struct TableView: View {
    @State var selectedCat: BreedDTO
    @State var colmns: [BreedColumn] = []
    
    init (selectedCat: BreedDTO) {
        _selectedCat = .init(initialValue: selectedCat)
    }
    

    var body: some View {
        ScrollView {
            HStack {
                Text("Quality")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Value")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .background(Color.green.opacity(0.2))
            .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 10)))

            LazyVStack(spacing: 4) {
                ForEach(colmns) { column in
                    HStack {
                        Text(column.text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        LevelView(level: Int(column.value))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .border(Color.black.opacity(0.1), width: 0.2)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 10)))
                }
            }
            
        }.onAppear {
            let cols : [BreedColumn] = [
                BreedColumn(id: 01, text: "Adaptability", value: String(selectedCat.adaptability ?? 0)),
                BreedColumn(id: 02, text: "Affection Level", value: String(selectedCat.affectionLevel ?? 0)),
                BreedColumn(id: 03, text: "Child Friendly", value: String(selectedCat.childFriendly ?? 0)),
                BreedColumn(id: 04, text: "Dog Friendly", value: String(selectedCat.dogFriendly ?? 0)),
                BreedColumn(id: 05, text: "Energy Level", value: String(selectedCat.energyLevel ?? 0)),
                BreedColumn(id: 06, text: "Grooming", value: String(selectedCat.grooming ?? 0)),
                BreedColumn(id: 07, text: "Health Issues", value: String(selectedCat.healthIssues ?? 0)),
                BreedColumn(id: 08, text: "Intelligence", value: String(selectedCat.intelligence ?? 0)),
                BreedColumn(id: 09, text: "Shedding Level", value: String(selectedCat.sheddingLevel ?? 0)),
                BreedColumn(id: 10, text: "Social Needs", value: String(selectedCat.socialNeeds ?? 0)),
                BreedColumn(id: 11, text: "Stranger Friendly", value: String(selectedCat.strangerFriendly ?? 0)),
                BreedColumn(id: 12, text: "Vocalisation", value: String(selectedCat.vocalisation ?? 0)),
                BreedColumn(id: 13, text: "Experimental", value: String(selectedCat.experimental ?? 0)),
                BreedColumn(id: 14, text: "Hairless", value: String(selectedCat.hairless ?? 0)),
                BreedColumn(id: 15, text: "Natural", value: String(selectedCat.natural ?? 0)),
                BreedColumn(id: 16, text: "Rare", value: String(selectedCat.rare ?? 0)),
                BreedColumn(id: 17, text: "Rex", value: String(selectedCat.rex ?? 0)),
                BreedColumn(id: 18, text: "Suppressed Tail", value: String(selectedCat.suppressedTail ?? 0)),
                BreedColumn(id: 19, text: "Short Legs", value: String(selectedCat.shortLegs ?? 0))
            ]
            colmns = cols
        }
    }
}

#Preview {
    TableView(selectedCat: dummyBreed)
}
