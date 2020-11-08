
import Foundation
import Combine

///
/// See https://swapi.dev/documentation#species for details.
///

extension StarWarsAPI {
    
    public func getSpecies() -> AnyPublisher<APIPage<Species>, Error> {
        getResource(at: url(.species))
    }
    
    public func getSpeciesPage(after page: APIPage<Species>) -> AnyPublisher<APIPage<Species>, Error> {
        getPage(after: page)
    }
    
    public func searchSpecies(name: String) -> AnyPublisher<APIPage<Species>, Error> {
        getResource(at: url(.species, ["search": name]))
    }
    
    public func getSpecies(id: SpeciesID) -> AnyPublisher<Species, Error> {
        getResource(at: url(.species, resource: id))
    }
    
    public func getSpecies(for reference: APIReference<Species>) -> AnyPublisher<Species, Error> {
        getResource(for: reference)
    }
}
