//
//  PersonsTableVC.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import UIKit

class PersonsTableVC: UITableViewController {
    
    var person: BBVAPersonsResponse? = nil
    var filterPerson: BBVAPersonsResponse? = nil
    
    lazy var refresh: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(handleRefresh( _: )), for: .valueChanged)
            refreshControl.tintColor = .purple
        return refreshControl
    }()
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
            searchController.searchBar.delegate = self
            searchController.searchResultsUpdater = self
            searchController.definesPresentationContext = true
            searchController.searchBar.keyboardAppearance = .light
            searchController.searchBar.autocapitalizationType = .none
            searchController.searchBar.searchTextField.placeholder = "Buscar por nombre"
        return searchController
    }()
    
    // MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
    }
    
    // MARK: - Table View Delegate & DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let counter = filterPerson?.results.count ?? 0
        return counter.isEquals(0) ? 1 : counter
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let filterCount = filterPerson?.results.count, filterCount.isGreaterThanOrEquals(1) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
            tableView.separatorStyle = .singleLine
            return setupPersonCell(from: cell, row: indexPath.row)
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoDataCell", for: indexPath) as! NoDataCell
            tableView.separatorStyle = .none
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Objc
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        person = nil
        filterPerson = nil
        
        DispatchQueue.main.async {
            self.getDataPersons()
            self.tableView.reloadData()
            self.refresh.endRefreshing()
        }
    }
    
    // MARK: - Functions
    func setupScreen() {
        title = "Persons"
        tableView.refreshControl = refresh
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UINib(nibName: "NoDataCell", bundle: .main), forCellReuseIdentifier: "NoDataCell")
        tableView.register(UINib(nibName: "PersonCell", bundle: .main), forCellReuseIdentifier: "PersonCell")
        getDataPersons()
    }
    
    func setupPersonCell(from cell: PersonCell, row: Int) -> PersonCell {
        if let result = self.filterPerson?.results[row] {
            cell.delegateAction = self
            cell.setupCell(from: result)
        }
        
        return cell
    }
}

extension PersonsTableVC: UISearchResultsUpdating, UISearchBarDelegate { //
   
    func updateSearchResults(for searchController: UISearchController) {
        filterContentByNAmet(searchController.searchBar.text!)
    }
    
    func filterContentByNAmet(_ searchText: String) {
        
        if !searchText.isEmpty {
            if let result = person {
                filterPerson?.results = result.results.filter ({ item in
                    let name = "\(item.name.title) \(item.name.first) \(item.name.last)"
                    return name.lowercased().contains(searchText.lowercased())
                })
            }
        } else {
            filterPerson = person
        }

        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filterPerson = person
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.isActive = false
    }
}


extension PersonsTableVC: ActionSelectedDelegate {
    func getItemSelected(_ item: Person) {
        simpleAlert(title: "La edad de \(item.name.title) \(item.name.first) es", message: "\(item.dob.age)")
    }
}
