import Foundation
import MapKit
import UIKit

extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Honolulu else{return nil}
      //  placeInfoView.frame = CGRect(x: 16, y: 800, width: 343, height: 214)
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "cell")
        if annotationView == nil{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "cell")
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
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let place = view.annotation as? Honolulu else{return}
        mapView.setCenter(place.coordinate, animated: true)
        let region = MKCoordinateRegion(center: place.coordinate, latitudinalMeters: 1500, longitudinalMeters: 1500)
        mapView.setRegion(region, animated: true)
        UIView.animate(withDuration: 0.3) {
            self.placeInfoViewHieght.constant = 214
            self.placeInfoView.layoutIfNeeded()
            self.hiddenInfoView(of: false)
        }
        placeTitleLabel.text = place.title
        placeLocationLabel.text = place.location
        placeDisciplineLabel.text = place.discipline
        placeDescriptionTextView.text = place.descriptionInfo
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let annotations = mapView.selectedAnnotations
        for annotation in annotations{
            UIView.animate(withDuration: 0.3){
                mapView.deselectAnnotation(annotation, animated: true)
            }
        }
    }
}
