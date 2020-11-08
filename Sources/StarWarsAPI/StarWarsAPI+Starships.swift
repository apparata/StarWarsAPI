
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
    
    public func searchStarships(nameOrModel: String) -> AnyPublisher<APIPage<Starship>, Error> {
        getResource(at: url(.starships, ["search": nameOrModel]))
    }
    
    public func getStarship(id: StarshipID) -> AnyPublisher<Starship, Error> {
        getResource(at: url(.starships, resource: id))
    }
    
    public func getStarship(for reference: APIReference<Starship>) -> AnyPublisher<Starship, Error> {
        getResource(for: reference)
    }
}
