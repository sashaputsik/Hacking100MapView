import UIKit
import MapKit
class Wildberries: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var address: String
    let jobTimeInterval = "Рабочие часы: 10:00-20:00"
    let info = "Пункт выдачи отправлений и покупок"
    let phoneNumber = 80173886000
    init(title: String,
         coordinate: CLLocationCoordinate2D,
         address: String) {
        self.title = title
        self.coordinate = coordinate
        self.address = address

    }
}


