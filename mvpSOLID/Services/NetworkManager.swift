//
//  NetworkManager.swift
//  mvpSOLID
//
//  Created by Goodwasp on 06.11.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchComments(completion: @escaping (Result<[Comment], Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    func fetchComments(completion: @escaping (Result<[Comment], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                guard let data = data else { return }
                let comments = try JSONDecoder().decode([Comment].self, from: data)
                
                completion(.success(comments))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
