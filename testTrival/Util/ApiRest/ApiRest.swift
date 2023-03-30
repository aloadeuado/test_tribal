//
//  ApiRest.swift
//  testTrival
//
//  Created by Invitado on 30/03/23.
//

import Foundation
class ApiRest {
    
    func getApiData<T: Codable>(url: String, params: [String: Any]?, headers: [String: Any]?, type: T.Type, correctStatus: Int, onComplete: @escaping ((Bool, T?, String?) -> Void) ) {
        
        let request_url = URL(string: url)
        
        let request:NSMutableURLRequest = NSMutableURLRequest()
        request.url = request_url
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        
        let session = URLSession.init(configuration: .default)
        
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            let response = (response as? HTTPURLResponse)
            if let error = error {
                onComplete(false, nil, error.localizedDescription)
                return
            }
            
            if response?.statusCode == correctStatus {
                do {
                    if let data = data {
                        let customData = try JSONDecoder().decode(T.self, from: data)
                        onComplete(true, customData, nil)
                        return
                    }
                    
                } catch {
                    onComplete(false, nil, error.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
}
