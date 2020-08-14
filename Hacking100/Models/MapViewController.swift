import UIKit
import MapKit

class MapViewController: UIViewController{
    let url = "https://data.honolulu.gov/resource/yef5-h88r.json"
    let coordination = CLLocationCoordinate2D()
    var isSearching = false
    @IBOutlet weak var mapView: MKMapView!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegates()
        parseMap()
        frameAndLayer()
        hiddenInfoView(of: true)
        placeInfoViewHieght.constant = 0
        searchViewHieght.constant = 0
        searchPlaceTableView.isHidden = true
        searchPlaceTableView.keyboardDismissMode = .onDrag
        searchButton.addTarget(self,
                               action: #selector(openSearchView),
                               for: .touchUpInside)
        closeInfoViewButton.addTarget(self,
                                      action: #selector(closePlaceInfoView),
                                      for: .touchUpInside)
        closePlaceSearchViewButton.addTarget(self,
                                             action: #selector(closeSearchPlaceView),
                                             for: .touchUpInside)
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
    }
    @objc func openSearchView(){
        searchViewHieght.constant = 500
        searchPlaceTableView.reloadData()
        searchPlaceTableView.isHidden = false
    }
    @objc func closePlaceInfoView(){
        placeInfoViewHieght.constant = 0
        hiddenInfoView(of: true)
        placeInfoView.layoutIfNeeded()
        for annotation in mapView.selectedAnnotations{
            mapView.deselectAnnotation(annotation,
                                       animated: true)
        }
    }
    @objc func closeSearchPlaceView(){
        searchViewHieght.constant = 0
        placeSearchBar.endEditing(true)
        
    }
    
}
