//
//  SchoolAPIClient.swift
//  20230125-LubaKaper-NYCSchools(2)
//
//  Created by Liubov Kaper  on 1/25/23.
//

import Foundation

// Getting Schools Info
func fetchAPIData(URL url: String, completion: @escaping ([School]) -> Void) {
    
    let url = URL(string: url)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!) { data, response, error in
        if data != nil && error == nil {
            do {
                let parsingData = try JSONDecoder().decode([School].self, from: data!)
                completion(parsingData)
            } catch {
                print("Parsing error \(error)")
            }
        }
    }
    dataTask.resume()
}

// Getting SAT info

func fetchScoreAPIData(URL url: String, completion: @escaping ([Score]) -> Void) {
    
    let url = URL(string: url)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!) { data, response, error in
        if data != nil && error == nil {
            do {
                let parsingData = try JSONDecoder().decode([Score].self, from: data!)
                completion(parsingData)
            } catch {
                print("Parsing error \(error)")
            }
        }
    }
    dataTask.resume()
}
