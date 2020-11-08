
import Foundation

public struct APIReference<Resource: Codable> {
    public let resourceType = Resource.self
    public let url: URL
}

// ---------------------------------------------------------------------------
// MARK: - Codable
// ---------------------------------------------------------------------------
        
extension APIReference: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let reference = try container.decode(String.self)
            .replacingOccurrences(of: "http:", with: "https:")
        url = URL(safe: reference)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(url.absoluteString)
    }
}
