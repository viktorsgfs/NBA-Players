//
//  Requests.swift
//  NBAtask
//
//  Created by Viktor Krastev on 16.07.23.
//

import Foundation

class Requests {
    
    static func fetchPlayers(page: Int, searchText: String? = nil, completion: @escaping (Result<PlayersResponseModel, Error>) -> Void) {
        
        let perPage = Constants.playersToFetch
        var urlString = "\(Constants.playersURL)?per_page=\(perPage)&page=\(page)"
        
        if let searchText = searchText, !searchText.isEmpty {
            let encodedSearchText = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            urlString += "&search=\(encodedSearchText)"
        }
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let players = try decoder.decode(PlayersResponseModel.self, from: data)
                completion(.success(players))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

}
