import UIKit
import MapKit
import CoreLocation


final class MapViewController: UIViewController{
    var isSearching = false
    @IBOutlet private(set) var mapView: MKMapView!
    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var placeInfoView: UIView!
    @IBOutlet weak var placeLocationLabel: UILabel!
    @IBOutlet weak var placeDisciplineLabel: UILabel!
    @IBOutlet weak var placeDescriptionTextView: UITextView!
    @IBOutlet weak var closeInfoViewButton: UIButton!
    @IBOutlet weak var placeInfoViewHieght: NSLayoutConstraint!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var searchPlaceTableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchViewHieght: NSLayoutConstraint!
    @IBOutlet weak var placeSearchBar: UISearchBar!
    @IBOutlet weak var closePlaceSearchViewButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        JsonParse().parseMap(of: url) { (annotation) in
            if  let lati = annotation[JsonKeys.latitude.rawValue] as? NSString,
                let long = annotation[JsonKeys.longitude.rawValue] as? NSString{
            let annotationMap = Honolulu(dictionary: annotation,
                                         coordinate: CLLocationCoordinate2D(latitude: lati.doubleValue,
                                                                            longitude: long.doubleValue))
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lati.doubleValue,
                                                                           longitude: long.doubleValue),
                                            latitudinalMeters: 30000,
                                            longitudinalMeters: 30000)
            DispatchQueue.main.async {
                self.mapView.setRegion(region,
                                       animated: true)
                self.mapView.addAnnotation(annotationMap)
                }
            }
        }
        frameAndLayer()
        setInfoView(isHidden: true)
        placeInfoViewHieght.constant = 0
        searchViewHieght.constant = 0
        searchPlaceTableView.isHidden = true
        searchPlaceTableView.keyboardDismissMode = .onDrag
        let closeInfoView = UISwipeGestureRecognizer(target: self,
                                                     action: #selector(closePlaceInfoView))
        closeInfoView.direction = .down
        placeInfoView.addGestureRecognizer(closeInfoView)
        if closeInfoViewButton.isSelected{
            closeInfoViewButton.tintColor = .darkGray
        }
        else{
            closeInfoViewButton.tintColor = .gray
        }
        searchButton.addTarget(self,
                               action: #selector(openSearchView),
                               for: .touchUpInside)
        closeInfoViewButton.addTarget(self,
                                      action: #selector(closePlaceInfoView),
                                      for: .touchUpInside)
        closePlaceSearchViewButton.addTarget(self,
                                             action: #selector(closeSearchPlaceView),
                                             for: .touchUpInside)
    }
    
    
    //MARK: Handler
    @objc
    func openSearchView(){
        searchViewHieght.constant = 500
        searchPlaceTableView.reloadData()
        searchPlaceTableView.isHidden = false
        closePlaceInfoView()
    }
    
    @objc
    func closePlaceInfoView(){
        placeInfoViewHieght.constant = 0
        setInfoView(isHidden: true)
        placeInfoView.layoutIfNeeded()
        for annotation in mapView.selectedAnnotations{
            mapView.deselectAnnotation(annotation,
                                       animated: true)
        }
    }
    
    @objc
    func closeSearchPlaceView(){
        searchViewHieght.constant = 0
        placeSearchBar.endEditing(true)
        placeSearchBar.text = ""
    }
    
}
