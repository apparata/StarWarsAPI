
import Foundation
import Combine

///
/// See https://swapi.dev/documentation#starships for details.
///

extension StarWarsAPI {
    
    public func getStarships() -> AnyPublisher<APIPage<Starship>, Error> {
        getResource(at: url(.starships))
    }
    
    public func getStarshipsPage(after page: APIPage<Starship>) -> AnyPublisher<APIPage<Starship>, Error> {
        getPage(after: page)
    }
    
    public func searchStarships(name: String) -> AnyPublisher<[Starship], Error> {
        getResource(at: url(.starships, ["search": name]))
    }
    
    public func getStarship(id: Int) -> AnyPublisher<Starship, Error> {
        getResource(at: url(.starships, resource: id))
    }
    
    public func getStarship(for reference: APIReference<Starship>) -> AnyPublisher<Starship, Error> {
        getResource(for: reference)
    }
}
