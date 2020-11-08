
import Foundation
import StarWarsAPI

let api = StarWarsAPI()

let filmsSubscription = api.getFilms()
    .sink { result in
        switch result {
        case .finished:
            break
        case .failure(let error):
            dump(error)
        }
    } receiveValue: { page in
        dump(page.items)
    }


RunLoop.main.run()
