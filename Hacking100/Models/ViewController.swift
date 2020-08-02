import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        addedCapital()
        frameAndLayer()
        mapView.delegate = self
        let latitude:Double = 52.092979
        let longitude:Double =  23.734466
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: span)
        mapView.setRegion(region, animated: true)
        infoView.frame = CGRect(x: 0, y: 900, width: view.frame.width, height: 50)
    }
    

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Wildberries else{return nil}
        let id = "Capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: id)
        
        if annotationView == nil{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: id)
            annotationView?.canShowCallout = true
            let infoButton = UIButton(type: .infoDark)
            annotationView?.rightCalloutAccessoryView = infoButton

            
        }else{
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let wildBr = view.annotation as? Wildberries else{return}
        let placeName = wildBr.title
        let placeInfo = wildBr.info        
        UIView.animate(withDuration: 0.5) {
            self.infoView.frame = CGRect(x: 5, y: 540, width: 365, height: 120)
        }
        self.infoLabel.text = placeInfo
        self.nameLabel.text = placeName
    }
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        UIView.animate(withDuration: 0.5) {
            self.infoView.frame = CGRect(x: 5, y: 900, width: 365, height: 120)
        }
    }
}

