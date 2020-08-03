import CoreLocation
import MapKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var jobTimeIntervalLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var phoneNumberButton: UIButton!
    var locationManager: CLLocationManager {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }
    var currentLocation = "Current location"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        frameAndLayer()
        mapView.delegate = self
        mapView.showsUserLocation = true
        let latitude:Double = 52.092979
        let longitude:Double =  23.734466
        let span = MKCoordinateSpan(latitudeDelta: 0.1,
                                    longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude,
                                                                       longitude: longitude),
                                        span: span)
        mapView.setRegion(region,
                          animated: true)
        infoView.frame = CGRect(x: 0,
                                y: 900,
                                width: view.frame.width,
                                height: 50)
        currentLocationAdded()
        addedCapital()
        phoneNumberButton.addTarget(self, action: #selector(called), for: .touchUpInside)
    }
    @objc func called(){
        guard let ann = mapView.annotations.last as? Wildberries else{return}
        
        if let url = URL(string: "tel://+\(ann.phoneNumber)"), UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    func currentLocationAdded(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    

    
}



