import CoreLocation
import Foundation
import MapKit
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        let current = location.coordinate
        let region = MKCoordinateRegion(center: current,
                                        latitudinalMeters: 800,
                                        longitudinalMeters: 800)
        mapView.setRegion(region,
                          animated: true)
        locationManager.stopUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print(error.localizedDescription)
        
    }
}
