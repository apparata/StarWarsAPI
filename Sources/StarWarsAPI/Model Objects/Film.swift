
import Foundation

public typealias FilmID = Int

///
/// See https://swapi.dev/documentation#films for details.
///
public struct Film {
    public let characters: [APIReference<Person>]
    public let created: String
    public let director: String
    public let edited: String
    public let episodeId: Int
    public let openingCrawl: String
    public let planets: [APIReference<Planet>]
    public let producer: String
    public let releaseDate: String
    public let species: [APIReference<Species>]
    public let starships: [APIReference<Starship>]
    public let title: String
    public let reference: APIReference<Film>
    public let vehicles: [APIReference<Vehicle>]
}

extension Film: Hashable, Equatable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(reference.url)
    }
    
    public static func == (lhs: Film, rhs: Film) -> Bool {
        lhs.reference.url == rhs.reference.url
    }
}

// ---------------------------------------------------------------------------
// MARK: - Codable
// ---------------------------------------------------------------------------
        
extension Film: Codable {
        
    enum CodingKeys: String, CodingKey {
        case characters
        case created
        case director
        case edited
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case planets
        case producer
        case releaseDate = "release_date"
        case species
        case starships
        case title
        case url
        case vehicles
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        characters = try container.decode([APIReference<Person>].self, forKey: .characters)
        created = try container.decode(String.self, forKey: .created)
        director = try container.decode(String.self, forKey: .director)
        edited = try container.decode(String.self, forKey: .edited)
        episodeId = try container.decode(Int.self, forKey: .episodeId)
        openingCrawl = try container.decode(String.self, forKey: .openingCrawl)
        planets = try container.decode([APIReference<Planet>].self, forKey: .planets)
        producer = try container.decode(String.self, forKey: .producer)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        species = try container.decode([APIReference<Species>].self, forKey: .species)
        starships = try container.decode([APIReference<Starship>].self, forKey: .starships)
        title = try container.decode(String.self, forKey: .title)
        reference = try container.decode(APIReference<Film>.self, forKey: .url)
        vehicles = try container.decode([APIReference<Vehicle>].self, forKey: .vehicles)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(characters, forKey: .characters)
        try container.encode(created, forKey: .created)
        try container.encode(director, forKey: .director)
        try container.encode(edited, forKey: .edited)
        try container.encode(episodeId, forKey: .episodeId)
        try container.encode(openingCrawl, forKey: .openingCrawl)
        try container.encode(planets, forKey: .planets)
        try container.encode(producer, forKey: .producer)
        try container.encode(releaseDate, forKey: .releaseDate)
        try container.encode(species, forKey: .species)
        try container.encode(starships, forKey: .starships)
        try container.encode(title, forKey: .title)
        try container.encode(reference, forKey: .url)
        try container.encode(vehicles, forKey: .vehicles)
    }
}
