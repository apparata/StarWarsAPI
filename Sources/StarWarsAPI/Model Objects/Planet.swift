
import Foundation

public typealias PlanetID = Int

///
/// See https://swapi.dev/documentation#planets for details.
///
public struct Planet {
    public let climate: String
    public let created: String
    public let diameter: String
    public let edited: String
    public let films: [APIReference<Film>]
    public let gravity: String
    public let name: String
    public let orbitalPeriod: String
    public let population: String
    public let residents: [APIReference<Person>]
    public let rotationPeriod: String
    public let surfaceWater: String
    public let terrain: String
    public let reference: APIReference<Planet>
}

// ---------------------------------------------------------------------------
// MARK: - Codable
// ---------------------------------------------------------------------------
        
extension Planet: Codable {
        
    enum CodingKeys: String, CodingKey {
        case climate
        case created
        case diameter
        case edited
        case films
        case gravity
        case name
        case orbitalPeriod = "orbital_period"
        case population
        case residents
        case rotationPeriod = "rotation_period"
        case surfaceWater = "surface_water"
        case terrain
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        climate = try container.decode(String.self, forKey: .climate)
        created = try container.decode(String.self, forKey: .created)
        diameter = try container.decode(String.self, forKey: .diameter)
        edited = try container.decode(String.self, forKey: .edited)
        films = try container.decode([APIReference<Film>].self, forKey: .films)
        gravity = try container.decode(String.self, forKey: .gravity)
        name = try container.decode(String.self, forKey: .name)
        orbitalPeriod = try container.decode(String.self, forKey: .orbitalPeriod)
        population = try container.decode(String.self, forKey: .population)
        residents = try container.decode([APIReference<Person>].self, forKey: .residents)
        rotationPeriod = try container.decode(String.self, forKey: .rotationPeriod)
        surfaceWater = try container.decode(String.self, forKey: .surfaceWater)
        terrain = try container.decode(String.self, forKey: .terrain)
        reference = try container.decode(APIReference<Planet>.self, forKey: .url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(climate, forKey: .climate)
        try container.encode(created, forKey: .created)
        try container.encode(diameter, forKey: .diameter)
        try container.encode(edited, forKey: .edited)
        try container.encode(films, forKey: .films)
        try container.encode(gravity, forKey: .gravity)
        try container.encode(name, forKey: .name)
        try container.encode(orbitalPeriod, forKey: .orbitalPeriod)
        try container.encode(population, forKey: .population)
        try container.encode(residents, forKey: .residents)
        try container.encode(rotationPeriod, forKey: .rotationPeriod)
        try container.encode(surfaceWater, forKey: .surfaceWater)
        try container.encode(terrain, forKey: .terrain)
        try container.encode(reference, forKey: .url)
    }
}
