
import Foundation
import Combine

///
/// See https://swapi.dev/documentation#vehicles for details.
///

extension StarWarsAPI {
    
    public func getVehicles() -> AnyPublisher<APIPage<Vehicle>, Error> {
        getResource(at: url(.vehicles))
    }
    
    public func getVehiclesPage(after page: APIPage<Vehicle>) -> AnyPublisher<APIPage<Vehicle>, Error> {
        getPage(after: page)
    }
    
    public func searchVehicles(name: String) -> AnyPublisher<[Vehicle], Error> {
        getResource(at: url(.vehicles, ["search": name]))
    }
    
    public func getVehicle(id: Int) -> AnyPublisher<Vehicle, Error> {
        getResource(at: url(.vehicles, resource: id))
    }
    
    public func getVehicle(for reference: APIReference<Vehicle>) -> AnyPublisher<Vehicle, Error> {
        getResource(for: reference)
    }
}
