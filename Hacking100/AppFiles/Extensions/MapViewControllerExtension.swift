import Foundation
import MapKit
import UIKit

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
                            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lati.doubleValue, longitude: long.doubleValue), latitudinalMeters: 30000, longitudinalMeters: 30000)
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
    func frameAndLayer(){
        placeInfoView.layer.cornerRadius = 10
        placeInfoView.layer.shadowOffset = CGSize(width: 1, height: 1)
        placeInfoView.layer.shadowOpacity = 0.4
    }
    func hiddenInfoView(of hidden: Bool){
        self.placeTitleLabel.isHidden = hidden
        self.placeDisciplineLabel.isHidden = hidden
        self.placeDescriptionTextView.isHidden = hidden
        self.placeLocationLabel.isHidden = hidden
        self.locationImageView.isHidden = hidden
    }
}
