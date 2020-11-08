
import Foundation

public typealias StarshipID = Int

///
/// See https://swapi.dev/documentation#starships for details.
///
public struct Starship {
    public let mGLT: String
    public let cargoCapacity: String
    public let consumables: String
    public let costInCredits: String
    public let created: String
    public let crew: String
    public let edited: String
    public let hyperdriveRating: String
    public let length: String
    public let manufacturer: String
    public let maxAtmospheringSpeed: String
    public let model: String
    public let name: String
    public let passengers: String
    public let films: [APIReference<Film>]
    public let pilots: [APIReference<Person>]
    public let starshipClass: String
    public let reference: APIReference<Starship>
}

extension Starship: Hashable, Equatable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(reference.url)
    }
    
    public static func == (lhs: Starship, rhs: Starship) -> Bool {
        lhs.reference.url == rhs.reference.url
    }
}

// ---------------------------------------------------------------------------
// MARK: - Codable
// ---------------------------------------------------------------------------
        
extension Starship: Codable {
        
    enum CodingKeys: String, CodingKey {
        case mGLT = "MGLT"
        case cargoCapacity = "cargo_capacity"
        case consumables
        case costInCredits = "cost_in_credits"
        case created
        case crew
        case edited
        case hyperdriveRating = "hyperdrive_rating"
        case length
        case manufacturer
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case model
        case name
        case passengers
        case films
        case pilots
        case starshipClass = "starship_class"
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mGLT = try container.decode(String.self, forKey: .mGLT)
        cargoCapacity = try container.decode(String.self, forKey: .cargoCapacity)
        consumables = try container.decode(String.self, forKey: .consumables)
        costInCredits = try container.decode(String.self, forKey: .costInCredits)
        created = try container.decode(String.self, forKey: .created)
        crew = try container.decode(String.self, forKey: .crew)
        edited = try container.decode(String.self, forKey: .edited)
        hyperdriveRating = try container.decode(String.self, forKey: .hyperdriveRating)
        length = try container.decode(String.self, forKey: .length)
        manufacturer = try container.decode(String.self, forKey: .manufacturer)
        maxAtmospheringSpeed = try container.decode(String.self, forKey: .maxAtmospheringSpeed)
        model = try container.decode(String.self, forKey: .model)
        name = try container.decode(String.self, forKey: .name)
        passengers = try container.decode(String.self, forKey: .passengers)
        films = try container.decode([APIReference<Film>].self, forKey: .films)
        pilots = try container.decode([APIReference<Person>].self, forKey: .pilots)
        starshipClass = try container.decode(String.self, forKey: .starshipClass)
        reference = try container.decode(APIReference<Starship>.self, forKey: .url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(mGLT, forKey: .mGLT)
        try container.encode(cargoCapacity, forKey: .cargoCapacity)
        try container.encode(consumables, forKey: .consumables)
        try container.encode(costInCredits, forKey: .costInCredits)
        try container.encode(created, forKey: .created)
        try container.encode(crew, forKey: .crew)
        try container.encode(edited, forKey: .edited)
        try container.encode(hyperdriveRating, forKey: .hyperdriveRating)
        try container.encode(length, forKey: .length)
        try container.encode(manufacturer, forKey: .manufacturer)
        try container.encode(maxAtmospheringSpeed, forKey: .maxAtmospheringSpeed)
        try container.encode(model, forKey: .model)
        try container.encode(name, forKey: .name)
        try container.encode(passengers, forKey: .passengers)
        try container.encode(films, forKey: .films)
        try container.encode(pilots, forKey: .pilots)
        try container.encode(starshipClass, forKey: .starshipClass)
        try container.encode(reference, forKey: .url)
    }
}
