import Foundation
import MapKit
extension ViewController{
    func addedCapital(){
        let partizanskiy = Wildberries(title: "Пункт выдачи", coordinate: CLLocationCoordinate2D(latitude: 52.102098, longitude: 23.761791), info: " Партизанский проспект 10", jobTimeInterval: "Рабочие часы: 10:00-20:00")
        let moskovskay = Wildberries(title: "Пункт выдачи", coordinate: CLLocationCoordinate2D(latitude: 52.102261, longitude:  23.781549), info: "Московская 301", jobTimeInterval: "Рабочие часы: 10:00-20:00")
        let bogdanovicha = Wildberries(title: "Пункт выдачи", coordinate: CLLocationCoordinate2D(latitude: 52.092078,  longitude: 23.767597), info:"Богдановича 124", jobTimeInterval: "Рабочие часы: 10:00-20:00")
        let oktbskRv = Wildberries(title: "Пункт самовывоза", coordinate: CLLocationCoordinate2D(latitude: 52.080852, longitude: 23.745083), info: "Октябрьской революции 7а", jobTimeInterval: "Рабочие часы: 10:00-20:00")
        mapView.addAnnotations([partizanskiy, moskovskay, bogdanovicha, oktbskRv])
    }
    func frameAndLayer(){
        infoView.layer.cornerRadius = 10
        infoView.layer.shadowOpacity = 0.4
        infoLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        
    }
    
}
