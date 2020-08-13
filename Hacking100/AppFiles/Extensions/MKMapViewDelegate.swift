import Foundation
import MapKit
import UIKit

extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Honolulu else{return nil}
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "cell")
        if annotationView == nil{
            annotationView = MKMarkerAnnotationView(annotation: annotation,
                                                    reuseIdentifier: "cell")
            annotationView?.canShowCallout = true
            let infoButton = UIButton(type: .infoLight)
            infoButton.tintColor = .systemRed
            annotationView?.leftCalloutAccessoryView = infoButton
        }
        else{
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        guard let place = view.annotation as? Honolulu else{return}
        mapView.setCenter(place.coordinate, animated: true)
        let region = MKCoordinateRegion(center: place.coordinate,
                                        latitudinalMeters: 1500,
                                        longitudinalMeters: 1500)
        mapView.setRegion(region,
                          animated: true)
        placeInfoViewHieght.constant = 214
        placeInfoView.layoutIfNeeded()
        hiddenInfoView(of: false)
        
        setPlaceViewInformation(title: place.title,
                                location: place.location,
                                discipline: place.discipline,
                                descriptionInfo: place.descriptionInfo)
    }
    func mapViewDidFailLoadingMap(_ mapView: MKMapView,
                                  withError error: Error) {
        let alertController = UIAlertController(title: "Error",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "Okey",
                                       style: .default,
                                       handler: nil)
        alertController.addAction(okeyAction)
        present(alertController,
                animated: true,
                completion: nil)
    }
   
}
