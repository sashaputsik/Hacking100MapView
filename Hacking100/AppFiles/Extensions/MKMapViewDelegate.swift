import Foundation
import MapKit
import UIKit

extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Honolulu else{return nil}
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
        UIView.animate(withDuration: 0.3) {
            self.placeInfoView.frame = CGRect(x: 16, y: 433, width: 343, height: 214)
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
                self.mapView.deselectAnnotation(annotation, animated: true)
               
            }
        }
    }
}
