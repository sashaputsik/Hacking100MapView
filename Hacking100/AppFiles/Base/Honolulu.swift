import Foundation
import MapKit
//{
//    ":@computed_region_7asa_3qps" = 6861;
//    access = Full;
//    artloc =         {
//        coordinates =             (
//            "-157.85167",
//            "21.304179"
//        );
//        type = Point;
//    };
//    creator = "Sandy Vitarelli";
//    credit = "City and County of Honolulu Purchase";
//    description = "A large ceramic urn from the artist's Land Series depicting taro with a prawn motif border. Located at the Alapai Police Station.";
//    discipline = "Urn, Garden";
//    imagefile = "http://hiculturearts.pastperfect-online.com/34250images/002/19920502e.JPG";
//    latitude = "21.304179";
//    location = "Alapai Police Station 2nd Floor Ewa Parapet";
//    longitude = "-157.85167";
//    objectid = "1992.05.02e";
//    title = "Mountain-LAND & SEA \"Taro\"";
//}

var honoluluObject = [Honolulu]()

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
