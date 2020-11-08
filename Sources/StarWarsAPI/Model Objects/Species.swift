
import Foundation

///
/// See https://swapi.dev/documentation#species for details.
///
public struct Species {
    public let averageHeight: String
    public let averageLifespan: String
    public let classification: String
    public let created: String
    public let designation: String
    public let edited: String
    public let eyeColors: String
    public let hairColors: String
    public let homeworld: APIReference<Planet>
    public let language: String
    public let name: String
    public let people: [APIReference<Person>]
    public let films: [APIReference<Film>]
    public let skinColors: String
    public let reference: APIReference<Species>
}

// ---------------------------------------------------------------------------
// MARK: - Codable
// ---------------------------------------------------------------------------
        
extension Species: Codable {
        
    enum CodingKeys: String, CodingKey {
        case averageHeight = "average_height"
        case averageLifespan = "average_lifespan"
        case classification
        case created
        case designation
        case edited
        case eyeColors = "eye_colors"
        case hairColors = "hair_colors"
        case homeworld
        case language
        case name
        case people
        case films
        case skinColors = "skin_colors"
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        averageHeight = try container.decode(String.self, forKey: .averageHeight)
        averageLifespan = try container.decode(String.self, forKey: .averageLifespan)
        classification = try container.decode(String.self, forKey: .classification)
        created = try container.decode(String.self, forKey: .created)
        designation = try container.decode(String.self, forKey: .designation)
        edited = try container.decode(String.self, forKey: .edited)
        eyeColors = try container.decode(String.self, forKey: .eyeColors)
        hairColors = try container.decode(String.self, forKey: .hairColors)
        homeworld = try container.decode(APIReference<Planet>.self, forKey: .homeworld)
        language = try container.decode(String.self, forKey: .language)
        name = try container.decode(String.self, forKey: .name)
        people = try container.decode([APIReference<Person>].self, forKey: .people)
        films = try container.decode([APIReference<Film>].self, forKey: .films)
        skinColors = try container.decode(String.self, forKey: .skinColors)
        reference = try container.decode(APIReference<Species>.self, forKey: .url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(averageHeight, forKey: .averageHeight)
        try container.encode(averageLifespan, forKey: .averageLifespan)
        try container.encode(classification, forKey: .classification)
        try container.encode(created, forKey: .created)
        try container.encode(designation, forKey: .designation)
        try container.encode(edited, forKey: .edited)
        try container.encode(eyeColors, forKey: .eyeColors)
        try container.encode(hairColors, forKey: .hairColors)
        try container.encode(homeworld, forKey: .homeworld)
        try container.encode(language, forKey: .language)
        try container.encode(name, forKey: .name)
        try container.encode(people, forKey: .people)
        try container.encode(films, forKey: .films)
        try container.encode(skinColors, forKey: .skinColors)
        try container.encode(reference, forKey: .url)
    }
}
