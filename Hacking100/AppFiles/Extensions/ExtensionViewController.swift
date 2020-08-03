import Foundation
import MapKit
extension ViewController{
    func addedCapital(){
        let partizanskiy = Wildberries(title: "Пункт выдачи",
                                       coordinate: CLLocationCoordinate2D(latitude: 52.102098, longitude: 23.761791),
                                       address: "Партизанский проспект 10")
        let moskovskay = Wildberries(title: "Пункт выдачи",
                                     coordinate: CLLocationCoordinate2D(latitude: 52.102261, longitude:  23.781549),
                                     address: "Московская 301")
        let bogdanovicha = Wildberries(title: "Пункт выдачи",
                                       coordinate: CLLocationCoordinate2D(latitude: 52.092078,  longitude: 23.767597),
                                       address: "Богдановича 124")
        let oktabrskoyRevolucii = Wildberries(title: "Пункт самовывоза",
                                              coordinate: CLLocationCoordinate2D(latitude: 52.080852, longitude: 23.745083),
                                              address: "Октябрьской революции 7а")
        let suvorova = Wildberries(title: "Пункт доставки",
                                   coordinate: CLLocationCoordinate2D(latitude: 52.070456, longitude: 23.754209),
                                   address: "Суворова 63")
        let morozova = Wildberries(title: "Пункт выдачи заказов", coordinate: CLLocationCoordinate2D(latitude: 52.075997, longitude: 23.722779), address: "Морозова 5/7")
        let mosherova = Wildberries(title: "Пункт самовывоза", coordinate: CLLocationCoordinate2D(latitude: 52.087547, longitude: 23.704158), address: "Машерова 53")
        let fomina = Wildberries(title: "Пункт выдачи", coordinate: CLLocationCoordinate2D(latitude: 52.086939, longitude:  23.676780), address: "Фомина 14")
        let engels = Wildberries(title: "Пункт самовывоза", coordinate: CLLocationCoordinate2D(latitude: 52.092111, longitude: 23.680164), address: "Энгельса 11")
        let komslomolskay = Wildberries(title: "Пункт выдачи заказов", coordinate: CLLocationCoordinate2D(latitude: 52.095463, longitude: 23.687197), address: "Комсомольская 23/1")
        let brestskieDivizii = Wildberries(title: "Пункт самовывоза", coordinate: CLLocationCoordinate2D(latitude: 52.102819, longitude:  23.672695), address: "Брестских девизий 18")
        mapView.addAnnotations([partizanskiy,
                                moskovskay,
                                bogdanovicha,
                                oktabrskoyRevolucii,
                                suvorova,
                                morozova,
                                mosherova,
                                fomina,
                                engels,
                                komslomolskay,
                                brestskieDivizii])
    }
    func frameAndLayer(){
        phoneNumberButton.layer.cornerRadius = phoneNumberButton.frame.height/2
        phoneNumberButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        phoneNumberButton.layer.shadowOpacity = 0.4
        infoView.layer.cornerRadius = 10
        infoView.layer.shadowOpacity = 0.4
        infoView.layer.shadowOffset = CGSize(width: 0.5,
                                             height: 0.5)
    }
    
}
