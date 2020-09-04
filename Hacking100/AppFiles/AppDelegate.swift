import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringVisits()
        locationManager.delegate = self
        return true
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
}


extension AppDelegate: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
          let location = CLLocationCoordinate2D(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)
                 print("location",location)
    }
    func newVisitReceived(_ visit: CLVisit, description: String) {
        let location = Honolulu(dictionary: [:], coordinate: visit.coordinate)

       // Save location to disk
     }
}
