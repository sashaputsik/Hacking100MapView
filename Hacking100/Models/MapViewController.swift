import UIKit
import MapKit

class MapViewController: UIViewController {
    let url = "https://data.honolulu.gov/resource/yef5-h88r.json"
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var placeInfoView: UIView!
    @IBOutlet weak var placeLocationLabel: UILabel!
    @IBOutlet weak var placeDisciplineLabel: UILabel!
    @IBOutlet weak var placeDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        parseMap()
        frameAndLayer()
        placeInfoView.frame = CGRect(x: 16, y: 800, width: 343, height: 214)
        let closeInfoView = UISwipeGestureRecognizer(target: self, action: #selector(close))
        closeInfoView.direction = .down
        placeInfoView.addGestureRecognizer(closeInfoView)
    }
    @objc func close(){
        UIView.animate(withDuration: 0.3) {
            self.placeInfoView.frame = CGRect(x: 16, y: 800, width: 343, height: 214)
        }
    }
    
}
