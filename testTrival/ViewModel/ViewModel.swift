//
//  ViewModel.swift
//  testTrival
//
//  Created by Invitado on 30/03/23.
//

import Foundation
import UIKit
class ViewModel : ViewToViewModel {
    
    
    let viewModelToView: ViewModelToView?
    weak var parent: UIViewController?
    var countRequest = 0
    var listJoke = [Joke]()
    init(parent: UIViewController, viewModelToView: ViewModelToView?) {
        self.parent = parent
        self.viewModelToView = viewModelToView
    }
    
    func getJoks(cpunt: Int) {
        listJoke = [Joke]()
        getCountJoke(maxCount: cpunt, count: 0)
    }
    
    func getCountJoke(maxCount: Int, count: Int) {
        var count1 = count
        CustomApi.getJoke { [weak self] joke, error in
            guard let self = self else {return}
            if let error = error {
                self.viewModelToView?.onError(error: error)
                return
            }
            count1 += 1
            if let joke = joke {
                self.listJoke.append(joke)
                
                if maxCount == count {
                    self.viewModelToView?.onCompleteGetJokes(jokes: self.listJoke)
                    return
                }
                self.getCountJoke(maxCount: maxCount, count: count1)
                return
            }
            self.getCountJoke(maxCount: maxCount, count: count1)
        }
    }
}
