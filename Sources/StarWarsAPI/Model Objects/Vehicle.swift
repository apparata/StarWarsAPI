
import Foundation

public typealias VehicleID = Int

///
/// See https://swapi.dev/documentation#vehicles for details.
///
public struct Vehicle {
    public let cargoCapacity: String
    public let consumables: String
    public let costInCredits: String
    public let created: String
    public let crew: String
    public let edited: String
    public let length: String
    public let manufacturer: String
    public let maxAtmospheringSpeed: String
    public let model: String
    public let name: String
    public let passengers: String
    public let pilots: [APIReference<Person>]
    public let films: [APIReference<Film>]
    public let reference: APIReference<Vehicle>
    public let vehicleClass: String
}

// ---------------------------------------------------------------------------
// MARK: - Codable
// ---------------------------------------------------------------------------
        
extension Vehicle: Codable {
        
    enum CodingKeys: String, CodingKey {
        case cargoCapacity = "cargo_capacity"
        case consumables
        case costInCredits = "cost_in_credits"
        case created
        case crew
        case edited
        case length
        case manufacturer
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case model
        case name
        case passengers
        case pilots
        case films
        case url
        case vehicleClass = "vehicle_class"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cargoCapacity = try container.decode(String.self, forKey: .cargoCapacity)
        consumables = try container.decode(String.self, forKey: .consumables)
        costInCredits = try container.decode(String.self, forKey: .costInCredits)
        created = try container.decode(String.self, forKey: .created)
        crew = try container.decode(String.self, forKey: .crew)
        edited = try container.decode(String.self, forKey: .edited)
        length = try container.decode(String.self, forKey: .length)
        manufacturer = try container.decode(String.self, forKey: .manufacturer)
        maxAtmospheringSpeed = try container.decode(String.self, forKey: .maxAtmospheringSpeed)
        model = try container.decode(String.self, forKey: .model)
        name = try container.decode(String.self, forKey: .name)
        passengers = try container.decode(String.self, forKey: .passengers)
        pilots = try container.decode([APIReference<Person>].self, forKey: .pilots)
        films = try container.decode([APIReference<Film>].self, forKey: .films)
        reference = try container.decode(APIReference<Vehicle>.self, forKey: .url)
        vehicleClass = try container.decode(String.self, forKey: .vehicleClass)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cargoCapacity, forKey: .cargoCapacity)
        try container.encode(consumables, forKey: .consumables)
        try container.encode(costInCredits, forKey: .costInCredits)
        try container.encode(created, forKey: .created)
        try container.encode(crew, forKey: .crew)
        try container.encode(edited, forKey: .edited)
        try container.encode(length, forKey: .length)
        try container.encode(manufacturer, forKey: .manufacturer)
        try container.encode(maxAtmospheringSpeed, forKey: .maxAtmospheringSpeed)
        try container.encode(model, forKey: .model)
        try container.encode(name, forKey: .name)
        try container.encode(passengers, forKey: .passengers)
        try container.encode(pilots, forKey: .pilots)
        try container.encode(films, forKey: .films)
        try container.encode(reference, forKey: .url)
        try container.encode(vehicleClass, forKey: .vehicleClass)
    }
}
