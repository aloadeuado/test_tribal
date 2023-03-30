//
//  Protocols.swift
//  testTrival
//
//  Created by Invitado on 30/03/23.
//

import Foundation
protocol ViewToViewModel: Any {
    func getJoks(cpunt: Int)
}

protocol ViewModelToView: Any {
    func onCompleteGetJokes(jokes: [Joke])
    func onError(error: String)
}
