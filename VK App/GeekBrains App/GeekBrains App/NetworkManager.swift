//
//  NetworkManager.swift
//  GeekBrains App
//
//  Created by Sanzhar on 25.02.2021.
//

import Foundation

class NetworkManager {
    private let urlString: String = "https://oauth.vk.com/authorize"
    
    func getResult() {
        let url = URL(string: urlString)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            // выводим в консоль
            print(json)
        }
        task.resume()
    }
    
}
