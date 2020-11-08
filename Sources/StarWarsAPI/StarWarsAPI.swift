
import Foundation
import Combine

public enum StarWarsAPIError: Error {
    case invalidResponse(URLResponse)
    case httpError(Int)
    case noMorePages
}

///
/// See https://swapi.dev/documentation for details.
///
public final class StarWarsAPI {
    
    enum Endpoint: String {
        case films
        case people
        case planets
        case species
        case starships
        case vehicles
    }
    
    private let baseURL = URL(safe: "https://swapi.dev/api")
    
    public init() {
        //
    }
    
    // MARK: - Get Next Page
    
    public func getPage<Resource: Decodable>(after page: APIPage<Resource>) -> AnyPublisher<APIPage<Resource>, Error> {
        guard let url = page.next else {
            return Fail(error: StarWarsAPIError.noMorePages)
                .eraseToAnyPublisher()
            
        }
        return getResource(at: URL(safe: url))
    }
    
    // MARK: - Get Resource By Reference
    
    func getResource<Resource: Decodable>(for reference: APIReference<Resource>) -> AnyPublisher<Resource, Error> {
        getResource(at: reference.url)
    }
    
    // MARK: - Get Resource By URL
    
    func getResource<T: Decodable>(at url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result in
                
                guard let response = result.response as? HTTPURLResponse else {
                    throw StarWarsAPIError.invalidResponse(result.response)
                }
                
                guard (200...299).contains(response.statusCode) else {
                    throw StarWarsAPIError.httpError(response.statusCode)
                }
                
                return try JSONDecoder().decode(T.self, from: result.data)
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: - URL Builder

    func url(_ endpoint: Endpoint, resource id: Int? = nil, _ parameters: [String: Any] = [:]) -> URL {
        let path = "/\(endpoint.rawValue)/" + (id.map { String($0) } ?? "")
        return url(path, parameters)
    }

    private func url(_ path: String, _ parameters: [String: Any] = [:]) -> URL {
        APIURLBuilder.buildURL(baseURL: baseURL, path: path, parameters: parameters)
    }
}
