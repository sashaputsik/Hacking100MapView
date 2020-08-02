import MapKit
import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var jobTimeIntervalLabel: UILabel!
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
    

    
}

