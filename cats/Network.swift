//
//  Network.swift
//  cats
//
//  Created by Veronica Tellez on 17/11/22.
//

import SwiftUI

class Network: ObservableObject {
    @Published var cats: [CatData] = []
    
    func getCats() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([CatData].self, from: data)
                        self.cats = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
