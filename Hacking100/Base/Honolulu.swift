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
        self.creator = dictionary[DTOKeys.creator.rawValue] as? String ?? ""
        self.credit = dictionary[DTOKeys.credit.rawValue] as? String ?? ""
        self.descriptionInfo = dictionary[DTOKeys.description.rawValue] as? String ?? ""
        self.discipline = dictionary[DTOKeys.discipline.rawValue] as? String ?? ""
        self.imageFile = dictionary[DTOKeys.imageFile.rawValue] as? String ?? ""
        self.objectId = dictionary[DTOKeys.objectId.rawValue] as? String ?? ""
        self.title = dictionary[DTOKeys.title.rawValue] as? String ?? ""
        self.location = dictionary[DTOKeys.location.rawValue] as? String ?? ""
    }
}


enum DTOKeys: String{
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

enum Localizable: String{
    case ok = "Okey"
    case error = "Error"
}
