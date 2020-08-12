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
    @IBOutlet weak var closeInfoViewButton: UIButton!
    @IBOutlet weak var placeInfoViewHieght: NSLayoutConstraint!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var placeSeearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeInfoViewHieght.constant = 0
        hiddenInfoView(of: true)
        mapView.delegate = self
        parseMap()
        frameAndLayer()
        closeInfoViewButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        let closeInfoView = UISwipeGestureRecognizer(target: self, action: #selector(close))
        closeInfoView.direction = .down
        placeInfoView.addGestureRecognizer(closeInfoView)
        if closeInfoViewButton.isSelected{
            closeInfoViewButton.tintColor = .darkGray
        }
        else{
            closeInfoViewButton.tintColor = .gray
        }
    }
    @objc func close(){
        placeInfoViewHieght.constant = 0
        hiddenInfoView(of: true)
        placeInfoView.layoutIfNeeded()
    }
    
}
