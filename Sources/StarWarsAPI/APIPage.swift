
import Foundation

public struct APIPage<Resource: Codable> {

    public let items: [Resource]
    public let totalCount: Int

    public var hasMorePages: Bool { !isLastPage }
    public var isLastPage: Bool { next == nil }
    public var isFirstPage: Bool { previous == nil }

    let next: String?
    let previous: String?
}

// ---------------------------------------------------------------------------
// MARK: - Codable
// ---------------------------------------------------------------------------
        
extension APIPage: Codable {
        
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalCount = try container.decode(Int.self, forKey: .count)
        next = try container.decodeIfPresent(String.self, forKey: .next)?
            .replacingOccurrences(of: "http:", with: "https:")
        previous = try container.decodeIfPresent(String.self, forKey: .previous)?
            .replacingOccurrences(of: "http:", with: "https:")
        items = try container.decode([Resource].self, forKey: .results)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(totalCount, forKey: .count)
        try container.encodeIfPresent(next, forKey: .next)
        try container.encodeIfPresent(previous, forKey: .previous)
        try container.encode(items, forKey: .results)
    }
}
