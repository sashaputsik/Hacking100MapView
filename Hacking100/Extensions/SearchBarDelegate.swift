import Foundation
import UIKit
import MapKit

extension MapViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        isSearching = false
        searchPlaceTableView.isHidden = true
        searchBar.text = ""
        searchViewHieght.constant = 0
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchPlaceTableView.isHidden = false   
    }
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        isSearching = true
        searchingPlace = honoluluPlace.filter({$0.contains(searchText)})
        searchPlaceTableView.reloadData()
    }
    
}
