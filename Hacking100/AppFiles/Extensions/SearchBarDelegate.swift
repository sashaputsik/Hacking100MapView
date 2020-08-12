import Foundation
import UIKit
import MapKit

extension MapViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        for annotation in mapView.annotations{
            guard let annotationPlace = annotation as? Honolulu else{return}
            if searchBar.text == annotationPlace.title{
                let region = MKCoordinateRegion(center: annotationPlace.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                mapView.setRegion(region, animated: true)
            }
        }
        searchBar.endEditing(true)
        isSearching = false
        searchPlaceTableView.isHidden = true
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchPlaceTableView.isHidden = false   
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = true
        searchingPlace = honoluluPlace.filter({$0.contains(searchText)})
        searchPlaceTableView.reloadData()
    }
    
    
}
