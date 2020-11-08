
import Foundation
import Combine

///
/// See https://swapi.dev/documentation#people for details.
///

extension StarWarsAPI {
    
    public func getPeople() -> AnyPublisher<APIPage<Person>, Error> {
        getResource(at: url(.people))
    }
    
    public func getPeoplePage(after page: APIPage<Person>) -> AnyPublisher<APIPage<Person>, Error> {
        getPage(after: page)
    }
    
    public func searchPeople(name: String) -> AnyPublisher<APIPage<Person>, Error> {
        getResource(at: url(.people, ["search": name]))
    }
    
    public func getPerson(id: PersonID) -> AnyPublisher<Person, Error> {
        getResource(at: url(.people, resource: id))
    }
    
    public func getPerson(for reference: APIReference<Person>) -> AnyPublisher<Person, Error> {
        getResource(for: reference)
    }
}
