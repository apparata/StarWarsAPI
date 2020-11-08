
import Foundation
import Combine

///
/// See https://swapi.dev/documentation#films for details.
///

extension StarWarsAPI {
    
    public func getFilms() -> AnyPublisher<APIPage<Film>, Error> {
        getResource(at: url(.films))
    }
    
    public func getFilmsPage(after page: APIPage<Film>) -> AnyPublisher<APIPage<Film>, Error> {
        getPage(after: page)
    }
    
    public func searchFilms(title: String) -> AnyPublisher<[Film], Error> {
        getResource(at: url(.films, ["search": title]))
    }
    
    public func getFilm(id: Int) -> AnyPublisher<Film, Error> {
        getResource(at: url(.films, resource: id))
    }
    
    public func getFilm(for reference: APIReference<Film>) -> AnyPublisher<Film, Error> {
        getResource(for: reference)
    }
}
