
import Foundation
import Combine

///
/// See https://swapi.dev/documentation#planets for details.
///

extension StarWarsAPI {
    
    public func getPlanets() -> AnyPublisher<APIPage<Planet>, Error> {
        getResource(at: url(.planets))
    }
    
    public func getPlanetsPage(after page: APIPage<Planet>) -> AnyPublisher<APIPage<Planet>, Error> {
        getPage(after: page)
    }
    
    public func searchPlanets(name: String) -> AnyPublisher<APIPage<Planet>, Error> {
        getResource(at: url(.planets, ["search": name]))
    }
    
    public func getPlanet(id: PlanetID) -> AnyPublisher<Planet, Error> {
        getResource(at: url(.planets, resource: id))
    }
    
    public func getPlanet(for reference: APIReference<Planet>) -> AnyPublisher<Planet, Error> {
        getResource(for: reference)
    }
}
