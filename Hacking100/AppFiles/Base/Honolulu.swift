import Foundation
import MapKit

var honoluluPlace = [String]()
var searchingPlace = [String]()
class Honolulu: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var creator: String
    var credit: String
    var descriptionInfo: String
    var discipline: String
    var imageFile: String
    var objectId: String
    var title:String?
    var location: String
    init(dictionary: [String: Any], coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
        self.creator = dictionary["creator"] as? String ?? ""
        self.credit = dictionary["credit"] as? String ?? ""
        self.descriptionInfo = dictionary["description"] as? String ?? ""
        self.discipline = dictionary["discipline"] as? String ?? ""
        self.imageFile = dictionary["imagefile"] as? String ?? ""
        self.objectId = dictionary["objectid"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.location = dictionary["location"] as? String ?? ""
    }
}
