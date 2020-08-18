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
    init(dictionary: [String: Any],
         coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
        self.creator = dictionary[JsonKeys.creator.rawValue] as? String ?? ""
        self.credit = dictionary[JsonKeys.credit.rawValue] as? String ?? ""
        self.descriptionInfo = dictionary[JsonKeys.description.rawValue] as? String ?? ""
        self.discipline = dictionary[JsonKeys.discipline.rawValue] as? String ?? ""
        self.imageFile = dictionary[JsonKeys.imageFile.rawValue] as? String ?? ""
        self.objectId = dictionary[JsonKeys.objectId.rawValue] as? String ?? ""
        self.title = dictionary[JsonKeys.title.rawValue] as? String ?? ""
        self.location = dictionary[JsonKeys.location.rawValue] as? String ?? ""
    }
}


enum JsonKeys: String{
    case latitude = "latitude"
    case longitude = "longitude"
    case creator = "creator"
    case credit = "credit"
    case description = "description"
    case discipline = "discipline"
    case imageFile = "imagefile"
    case objectId = "objectId"
    case title = "title"
    case location = "location"
}


