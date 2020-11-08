
import Foundation

class APIURLBuilder {
    
    static func buildURL(baseURL: URL, path: String, parameters: [String: Any] = [:]) -> URL {
        
        let url = baseURL.appendingPathComponent(path)
        
        guard !parameters.isEmpty else {
            return url
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let queryItems = parameters.map {
            return URLQueryItem(name: "\($0)", value: "\($1)")
        }
        urlComponents?.queryItems = queryItems
        let urlWithComponents = urlComponents?.url
        return urlWithComponents ?? url
    }
    
}
