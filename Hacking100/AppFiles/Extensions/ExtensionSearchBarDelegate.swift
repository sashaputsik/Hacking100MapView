import Foundation
import UIKit
import MapKit

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        for annotationMap in mapView.annotations{
            guard let  annotation = annotationMap as? Wildberries else{return}
            
            if annotation.address == searchBar.text{
                let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
                UIView.animate(withDuration: 0.5) {
                    self.mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}
