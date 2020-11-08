
import Foundation
import StarWarsAPI
import Combine

let api = StarWarsAPI()

let filmsSubscription = api.getFilms()
    .sink {
        if case .failure(let error) = $0 {
            dump(error)
        }
    } receiveValue: { page in
        dump(page.items)
    }

api.searchPeople(name: "Luke")
    .subscribe(Subscribers.Sink(receiveCompletion: {
        if case .failure(let error) = $0 {
            dump(error)
        }
    }, receiveValue: {
        print("Found Luke: \($0)")
    }))

RunLoop.main.run()
