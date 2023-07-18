//
//  HomeViewController.swift
//  NBAtask
//
//  Created by Viktor Krastev on 16.07.23.
//

import UIKit

class HomeViewController: UITableViewController, HomeBaseCoordinated {
    
    private var dataSource: [Player] = []
    private var allPlayers: [Player] = []
    private var filteredPlayers: [Player] = []
    let searchBar = UISearchBar()
    var coordinator: HomeBaseCoordinator?
    var searchText: String? = nil {
        didSet {
            self.fetchPlayers(searchText: searchText)
        }
    }
    var isSearching = false
    
    init(coordinator: HomeBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        
        title = "Players"
        self.coordinator = coordinator
        self.tableView.estimatedRowHeight = 50
        self.registerCells()
        self.configureSearchBar()
        self.fetchPlayers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func configureSearchBar() {
        
        searchBar.delegate = self
        searchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 80)
        tableView.tableHeaderView = searchBar
    }
    
    private func fetchPlayers(searchText: String? = "") {
        
        self.isSearching = true
        Requests.fetchPlayers(page: 1, searchText: searchText) { result in
            switch result {
            case .success(let players):

                self.isSearching = false
                print("\(players)")
                self.allPlayers = players.data
                self.dataSource = self.allPlayers
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                
                self.isSearching = false
                print("Error fetching players: \(error)")
            }
        }
    }
    
    private func registerCells() {
        self.tableView.register(UINib(nibName: "\(PlayerTableViewCell.self)", bundle: nil), forCellReuseIdentifier: Constants.playersCellIdentifier)
        self.tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: Constants.loadingCellIdentifier)

    }
    
}

// MARK: TableView methods
extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? 1 : self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isSearching {
            let loadingCell = tableView.dequeueReusableCell(withIdentifier: Constants.loadingCellIdentifier, for: indexPath) as! LoadingTableViewCell
            
            loadingCell.startAnimating()
            return loadingCell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.playersCellIdentifier, for: indexPath) as! PlayerTableViewCell
            
            cell.playerNamesLabel.text = "\(self.dataSource[indexPath.row].firstName) \(self.dataSource[indexPath.row].lastName)"
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearching {
            return
        }
        self.coordinator?.goToPlayerDetails(player: self.dataSource[indexPath.row])
    }

}

// MARK: SearchBar methods
extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            self.dataSource = allPlayers
        } else {
            self.searchText = searchText
        }
        
        tableView.reloadData()
    }
}
