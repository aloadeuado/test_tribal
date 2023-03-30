//
//  CustomApi.swift
//  testTrival
//
//  Created by Invitado on 30/03/23.
//

import Foundation
import UIKit

struct CustomApi {
    static func getJoke(onComplete: @escaping ((Joke?, String?) -> Void)) {
        ApiRest().getApiData(url: "https://api.chucknorris.io/jokes/random", params: nil, headers: nil, type: Joke.self, correctStatus: 200, onComplete: {
            (success, data, error) in
            if success {
                onComplete(data, nil)
                return
            }
            if success {
                onComplete(nil, error)
            }
        })
    }
}
