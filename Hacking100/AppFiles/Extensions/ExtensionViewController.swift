import Foundation
import MapKit
extension ViewController{
    func addedCapital(){
        let partizanskiy = Wildberries(title: "Пункт выдачи", coordinate: CLLocationCoordinate2D(latitude: 52.102098, longitude: 23.761791), address: "Партизанский проспект 10", jobTimeInterval: "Рабочие часы: 10:00-20:00", info: "Пункт выдачи отправлений и покупок")
        let moskovskay = Wildberries(title: "Пункт выдачи", coordinate: CLLocationCoordinate2D(latitude: 52.102261, longitude:  23.781549), address: "Московская 301", jobTimeInterval: "Рабочие часы: 10:00-20:00", info: "Пункт выдачи отправлений и покупок")
        let bogdanovicha = Wildberries(title: "Пункт выдачи", coordinate: CLLocationCoordinate2D(latitude: 52.092078,  longitude: 23.767597), address: "Богдановича 124", jobTimeInterval: "Рабочие часы: 10:00-20:00", info: "Пункт выдачи отправлений и покупок")
        let oktabrskoyRevolucii = Wildberries(title: "Пункт самовывоза", coordinate: CLLocationCoordinate2D(latitude: 52.080852, longitude: 23.745083), address: "Октябрьской революции 7а", jobTimeInterval: "Рабочие часы: 10:00-20:00", info: "Пункт выдачи отправлений и покупок")
        mapView.addAnnotations([partizanskiy, moskovskay, bogdanovicha, oktabrskoyRevolucii])
    }
    func frameAndLayer(){
        infoView.layer.cornerRadius = 10
        infoView.layer.shadowOpacity = 0.4
        infoView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    }
    
}
