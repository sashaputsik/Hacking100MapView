import Foundation
import MapKit
import UIKit
extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.infoView.frame = CGRect(x: 0, y: 900, width: self.view.frame.width, height: 50)
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Wildberries else{return nil}
        let id = "Wildberries"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: id)
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            annotationView?.tintColor = #colorLiteral(red: 0.712816596, green: 0.2272742391, blue: 0.5689561963, alpha: 1)
            annotationView?.canShowCallout = true
            let infoButton = UIButton(type: .infoDark)
            infoButton.tintColor = #colorLiteral(red: 0.712816596, green: 0.2272742391, blue: 0.5689561963, alpha: 1)
            annotationView?.rightCalloutAccessoryView = infoButton
        }
        else{
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let wildBr = view.annotation as? Wildberries else{return}
        let placeAddress = wildBr.address
        let placeJobTimeInterval = wildBr.jobTimeInterval
        let placeInfo = wildBr.info
        UIView.animate(withDuration: 0.5) {
            self.infoView.frame = CGRect(x: 5, y: 540, width: 365, height: 120)
        }
        self.jobTimeIntervalLabel.text = placeJobTimeInterval
        self.addressLabel.text = placeAddress
        self.infoLabel.text = placeInfo
    }
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        
        UIView.animate(withDuration: 0.3) {
            self.infoView.frame = CGRect(x: 5, y: 900, width: 365, height: 120)
        }
    }
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        let selected = mapView.selectedAnnotations
        for annotation in selected {
            UIView.animate(withDuration: 0.3) {
                 mapView.deselectAnnotation(annotation, animated: true)
            }
        }
    }
}
