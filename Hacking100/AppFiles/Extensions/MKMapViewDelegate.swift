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
            annotationView?.leftCalloutAccessoryView = infoButton
        }
        else{
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let place = view.annotation as? Honolulu else{return}
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Info") as? InfoViewController else{return}
        if let title = place.title {
            vc.placeTitle = title
            vc.creator = place.creator
            vc.descriptionInfo = place.descriptionInfo
            vc.discipline = place.discipline
            vc.location = place.location
        }
        showDetailViewController(vc, sender: nil)
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let annotations = mapView.selectedAnnotations
        for annotation in annotations{
            mapView.deselectAnnotation(annotation, animated: true)
        }
    }
}
