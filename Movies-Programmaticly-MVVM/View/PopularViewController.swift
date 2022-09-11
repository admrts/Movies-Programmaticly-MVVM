//
//  ViewController.swift
//  Movies-Programmaticly-MVVM
//
//  Created by Ali Demirtaş on 11.09.2022.
//

import UIKit

class PopularViewController: UIViewController {

    let tableView : UITableView = {
       let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    var service = WebService()
    var mainListViewModel : MainListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Popular"
        layout()
        tableView.dataSource = self
        getData()
    }
    func getData() {
        let url = URL(string: "\(Api.mainUrl)popular\(Api.apiKey)")!
        service.LoadMovies(url: url) { movies in
            if let movies = movies {
                self.mainListViewModel = MainListViewModel(moviesList: movies)
                DispatchQueue.main.async {
                   
                    self.tableView.reloadData()
                   
                }
            }
        }
    }


    func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
extension PopularViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainListViewModel == nil ? 0 : self.mainListViewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        let mainListViewModel = mainListViewModel.movieAtIndex(index: indexPath.row)
        cell.textLabel?.text = mainListViewModel.title(index: indexPath.row)
        return cell
    }
}

