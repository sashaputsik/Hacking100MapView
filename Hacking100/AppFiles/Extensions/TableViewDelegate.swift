import Foundation
import MapKit
import UIKit

extension MapViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchingPlace.count
        }
        else{
            return honoluluPlace.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if isSearching{
            cell.textLabel?.text = searchingPlace[indexPath.row]
        }
        else{
            cell.textLabel?.text = honoluluPlace[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var placeTitle = ""
        if isSearching{
            placeTitle = searchingPlace[indexPath.row]
        }
        else{
            placeTitle = honoluluPlace[indexPath.row]
        }
    
        for annotation in mapView.annotations{
            guard let places = annotation as? Honolulu else{return}
            if placeTitle == places.title{
                let region = MKCoordinateRegion(center: places.coordinate, latitudinalMeters: 1500, longitudinalMeters: 1500)
                mapView.setRegion(region, animated: true)
            }
        }
        placeSearchBar.endEditing(true)
        searchPlaceTableView.isHidden = true
    }
    
}
