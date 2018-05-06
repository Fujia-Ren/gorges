//
//  ViewController.swift
//  Gorges
//
//  Created by Fujia Ren on 4/26/18.
//  Copyright © 2018 Fujia Ren. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate{
    
    var timer: Timer?
    var searchController: UISearchController!
    let restaurantCellIdentifier = "RestaurantCell"
    var restaurants: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 220/255, green: 179/255, blue: 255/255, alpha: 1.0)
        title = "Restaurants"
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.barTintColor = UIColor(displayP3Red: 161/255, green: 87/255, blue: 225/255, alpha: 1.0)
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Restaurants"
        searchController.searchBar.sizeToFit()
        
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
    }
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: restaurantCellIdentifier) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: restaurantCellIdentifier)
        let restaurant = restaurants[indexPath.row]
        cell.backgroundColor = UIColor(displayP3Red: 161/255, green: 87/255, blue: 225/255, alpha: 1.0)
        cell.textLabel?.text = restaurant.name
        cell.textLabel?.textColor = .white
        return cell
    }
    
    // UITableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = restaurants[indexPath.row]
        
        let modalVC = DetailNavViewController()
        modalVC.name = restaurant.name
        modalVC.rating = restaurant.rating
        modalVC.address1 = restaurant.address1
        modalVC.address2 = restaurant.address2
        modalVC.phone = restaurant.phone
        modalVC.price = restaurant.price
        modalVC.previewLink = restaurant.previewLink
        present(modalVC, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(getRestaurants(_:)), userInfo: ["searchText": searchText], repeats: false)
    }
    
    @objc func getRestaurants(_ timer: Timer) {
        guard
            let userInfo = timer.userInfo as? [String : String],
            let searchText = userInfo["searchText"]
            else {
                return
        }
        if !searchText.isEmpty && searchText != "" {
            Network.getRestaurants(withQuery: searchText) { (restaurants) in
                self.restaurants = restaurants
                self.tableView.reloadData()
            }
        }
        else {
            self.restaurants = []
            self.tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

