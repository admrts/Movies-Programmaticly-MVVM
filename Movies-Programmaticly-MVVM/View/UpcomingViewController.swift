//
//  UpcomingViewController.swift
//  Movies-Programmaticly-MVVM
//
//  Created by Ali Demirtaş on 12.09.2022.
//

import Foundation

import UIKit

class UpcomingViewController: UIViewController {
    let tableView : UITableView = {
       let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    let service = WebService()
    var mainListViewModel: MainListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upcoming"
        view.addSubview(tableView)
        layout()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    
    func getData() {
        let url = URL(string: "\(Api.mainUrl)upcoming\(Api.apiKey)")!
        service.LoadMovies(url: url) { movies in
            if let movies = movies {
                self.mainListViewModel = MainListViewModel(moviesList: movies)
                DispatchQueue.main.async {
                   
                    self.tableView.reloadData()
                   
                }
            }
        }
    }
}
extension UpcomingViewController {
    
    func layout() {
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}
extension UpcomingViewController: UITableViewDataSource,UITableViewDelegate {
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
