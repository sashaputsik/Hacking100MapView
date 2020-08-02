import UIKit
import MapKit
class Wildberries: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var jobTimeInterval: String
    init(title: String,
         coordinate: CLLocationCoordinate2D,
         info: String,
         jobTimeInterval: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.jobTimeInterval = jobTimeInterval
    }
}


