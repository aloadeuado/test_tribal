//
//  ViewController.swift
//  testTrival
//
//  Created by Invitado on 30/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selfTableView: UITableView!
    var viewModel: ViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }

    func setData() {
        viewModel = ViewModel(parent: self, viewModelToView: self)
        viewModel?.getJoks(cpunt: 5)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CellTableViewCell {
            cell.llable.text = viewModel?.listJoke[indexPath.row].value ?? ""
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.listJoke.count ?? 0
    }
}

extension ViewController: ViewModelToView {
    func onCompleteGetJokes(jokes: [Joke]) {
        DispatchQueue.main.async { 
            self.selfTableView.reloadData()
        }
    }
    
    func onError(error: String) {
        //show error
    }
    
    
}

