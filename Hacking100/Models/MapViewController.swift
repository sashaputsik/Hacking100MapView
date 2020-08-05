import UIKit
import MapKit

class MapViewController: UIViewController {
    let url = "https://data.honolulu.gov/resource/yef5-h88r.json"
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        parseMap()
        
    }
    

}
extension MapViewController: MKMapViewDelegate{
    
}

extension MapViewController{
    func parseMap(){
        guard let url = URL(string: url) else{return}
               let session = URLSession.shared
               session.dataTask(with: url) { (data, response, error) in
                   guard let data = data else{return}
                   if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]{
                    for annotation in json{
                        if let lati = annotation["latitude"] as? NSString, let long = annotation["longitude"] as? NSString{
                            let annotationMap = Honolulu(dictionary: annotation, coordinate: CLLocationCoordinate2D(latitude: lati.doubleValue, longitude: long.doubleValue))
                            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lati.doubleValue, longitude: long.doubleValue), latitudinalMeters: 200, longitudinalMeters: 200)
                            DispatchQueue.main.async {
                                self.mapView.setRegion(region, animated: true)
                                self.mapView.addAnnotation(annotationMap)
                            }
                            print(annotationMap)
                        }
                    }
                }
               }.resume()
    }
}
