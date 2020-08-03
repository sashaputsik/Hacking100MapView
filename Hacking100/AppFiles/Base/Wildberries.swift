import UIKit
import MapKit
class Wildberries: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var address: String
    var jobTimeInterval: String
    var info: String
    init(title: String,
         coordinate: CLLocationCoordinate2D,
         address: String,
         jobTimeInterval: String, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.address = address
        self.jobTimeInterval = jobTimeInterval
        self.info = info

    }
}


