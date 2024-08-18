//
//  NetworkClient.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import Foundation

struct NetworkClient {

    func fetch<T: Codable>(url: URL, _ completion: @escaping (Result<T, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error {
                    completion(.failure(error))
                    return
                }

                guard let data, let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(URLError(.badServerResponse)))
                    return
                }

                do {
                    completion(.success(try JSONDecoder().decode(T.self, from: data)))
                } catch {
                    completion(.failure(error))
                }
            }
            .resume()
        }
    }
}
