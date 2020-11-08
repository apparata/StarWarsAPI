
import Foundation

public typealias PersonID = Int

///
/// See https://swapi.dev/documentation#people for details.
///
public struct Person {
    public let birthYear: String
    public let eyeColor: String
    public let films: [APIReference<Film>]
    public let gender: String
    public let hairColor: String
    public let height: String
    public let homeworld: APIReference<Planet>
    public let mass: String
    public let name: String
    public let skinColor: String
    public let created: String
    public let edited: String
    public let species: [APIReference<Species>]
    public let starships: [APIReference<Starship>]
    public let reference: APIReference<Person>
    public let vehicles: [APIReference<Vehicle>]
}


extension Person: Hashable, Equatable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(reference.url)
    }
    
    public static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.reference.url == rhs.reference.url
    }
}

// ---------------------------------------------------------------------------
// MARK: - Codable
// ---------------------------------------------------------------------------
        
extension Person: Codable {
        
    enum CodingKeys: String, CodingKey {
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case films
        case gender
        case hairColor = "hair_color"
        case height
        case homeworld
        case mass
        case name
        case skinColor = "skin_color"
        case created
        case edited
        case species
        case starships
        case url
        case vehicles
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        birthYear = try container.decode(String.self, forKey: .birthYear)
        eyeColor = try container.decode(String.self, forKey: .eyeColor)
        films = try container.decode([APIReference<Film>].self, forKey: .films)
        gender = try container.decode(String.self, forKey: .gender)
        hairColor = try container.decode(String.self, forKey: .hairColor)
        height = try container.decode(String.self, forKey: .height)
        homeworld = try container.decode(APIReference<Planet>.self, forKey: .homeworld)
        mass = try container.decode(String.self, forKey: .mass)
        name = try container.decode(String.self, forKey: .name)
        skinColor = try container.decode(String.self, forKey: .skinColor)
        created = try container.decode(String.self, forKey: .created)
        edited = try container.decode(String.self, forKey: .edited)
        species = try container.decode([APIReference<Species>].self, forKey: .species)
        starships = try container.decode([APIReference<Starship>].self, forKey: .starships)
        reference = try container.decode(APIReference<Person>.self, forKey: .url)
        vehicles = try container.decode([APIReference<Vehicle>].self, forKey: .vehicles)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(birthYear, forKey: .birthYear)
        try container.encode(eyeColor, forKey: .eyeColor)
        try container.encode(films, forKey: .films)
        try container.encode(gender, forKey: .gender)
        try container.encode(hairColor, forKey: .hairColor)
        try container.encode(height, forKey: .height)
        try container.encode(homeworld, forKey: .homeworld)
        try container.encode(mass, forKey: .mass)
        try container.encode(name, forKey: .name)
        try container.encode(skinColor, forKey: .skinColor)
        try container.encode(created, forKey: .created)
        try container.encode(edited, forKey: .edited)
        try container.encode(species, forKey: .species)
        try container.encode(starships, forKey: .starships)
        try container.encode(reference, forKey: .url)
        try container.encode(vehicles, forKey: .vehicles)
    }
}
