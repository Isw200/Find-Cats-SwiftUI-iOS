//
//  breedDTO.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-23.
//

import Foundation

struct BreedDTO: Codable, Identifiable {
    let weight: WeightDTO
    let id, name: String
    let cfaURL: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?
    let temperament, origin, countryCodes, countryCode: String?
    let description, lifeSpan: String?
    let indoor, lap: Int?
    let altNames: String?
    let adaptability, affectionLevel, childFriendly, dogFriendly: Int?
    let energyLevel, grooming, healthIssues, intelligence: Int?
    let sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int?
    let experimental, hairless, natural, rare: Int?
    let rex, suppressedTail, shortLegs: Int?
    let wikipediaURL: String?
    let hypoallergenic: Int?
    let referenceImageID: String?

    enum CodingKeys: String, CodingKey {
        case weight, id, name
        case cfaURL = "cfa_url"
        case vetstreetURL = "vetstreet_url"
        case vcahospitalsURL = "vcahospitals_url"
        case temperament, origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case description
        case lifeSpan = "life_span"
        case indoor, lap
        case altNames = "alt_names"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation, experimental, hairless, natural, rare, rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic
        case referenceImageID = "reference_image_id"
    }
}

struct WeightDTO: Codable {
    let imperial, metric: String
}


var dummyBreed: BreedDTO {
    .init(
        weight: WeightDTO(imperial: "8 - 15 lbs", metric: "3.6 - 6.8 kg"),
           id: "abys",
           name: "Abyssinian",
           cfaURL: "http://cfa.org/Breeds/Breeds/Abysinnian.html",
           vetstreetURL: "http://www.vetstreet.com/cats/abyssinian",
           vcahospitalsURL: "https://vcahospitals.com/know-your-pet/abyssinian",
           temperament: "Active, Energetic, Independent, Intelligent",
           origin: "Egypt",
           countryCodes: "EG",
           countryCode: "EG",
           description: "The Abyssinian is known for its ticked coat, and its playful and active nature.",
           lifeSpan: "14 - 15 years",
           indoor: 0,
           lap: 0,
           altNames: "",
           adaptability: 5,
           affectionLevel: 4,
           childFriendly: 3,
           dogFriendly: 3,
           energyLevel: 3,
           grooming: 2,
           healthIssues: 2,
           intelligence: 5,
           sheddingLevel: 3,
           socialNeeds: 4,
           strangerFriendly: 3,
           vocalisation: 2,
           experimental: 0,
           hairless: 0,
           natural: 1,
           rare: 0,
           rex: 0,
           suppressedTail: 0,
           shortLegs: 0,
           wikipediaURL: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
           hypoallergenic: 0,
           referenceImageID: "0XYvRd7oD"
    )
}
