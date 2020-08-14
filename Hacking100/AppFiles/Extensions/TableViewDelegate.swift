import Foundation
import MapKit
import UIKit

extension MapViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchingPlace.count
        }
        else{
            return honoluluPlace.count
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        if isSearching{
            cell.textLabel?.text = searchingPlace[indexPath.row]
        }
        else{
            cell.textLabel?.text = honoluluPlace[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        var placeTitle = ""
        if isSearching{
            placeTitle = searchingPlace[indexPath.row]
        }
        else{
            placeTitle = honoluluPlace[indexPath.row]
        }
    
        for annotation in mapView.annotations{
            guard let selectedPlace = annotation as? Honolulu else{return}
            if placeTitle == selectedPlace.title{
                let region = MKCoordinateRegion(center: selectedPlace.coordinate,
                                                latitudinalMeters: 1500,
                                                longitudinalMeters: 1500)
                UIView.animate(withDuration: 0.7) {
                    self.mapView.setRegion(region,
                                           animated: true)
                    self.mapView.selectAnnotation(annotation,
                                                  animated: true)
                }
                setPlaceViewInformation(title: selectedPlace.title,
                                        location: selectedPlace.location,
                                        discipline: selectedPlace.discipline,
                                        descriptionInfo: selectedPlace.descriptionInfo)
            }
        }
        placeInfoViewHieght.constant = 214
        searchViewHieght.constant = 0
        placeInfoView.layoutIfNeeded()
        placeSearchBar.endEditing(true)
        searchPlaceTableView.isHidden = true
        hiddenInfoView(of: false)
    }    
}
