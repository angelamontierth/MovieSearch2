//
//  MovieController.swift
//  movieSearch2
//
//  Created by Angela Montierth on 3/3/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie?")
    
    static func searchMovies(for title: String, completion: @escaping ([Movie]) -> Void) {
        
        guard let unwrappedURL = baseURL else { return }
        
        let apiKey = "79e77df6ddd71c9cc245f34dfb6220e8"
        
        let parameters = ["api_key": apiKey, "query": title]
        
        NetworkController.performRequest(for: unwrappedURL, httpMethod: .Get, urlParameters: parameters, body: nil) { (data, error) in
            
            if let error = error {
                print(error)
                completion([])
                return
            }
            
            guard let data = data,
            let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any]
                else { completion([]); return }
            
            guard let movieArray = jsonDictionary["results"] as? [[String:Any]]
                else { completion([]); return }
            
            let movies = movieArray.flatMap({ Movie(dictionary: $0)})
            
            completion(movies)
            
        }
        
    }
    
    
    
    
    
}
