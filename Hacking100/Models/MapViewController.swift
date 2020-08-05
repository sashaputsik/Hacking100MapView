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
