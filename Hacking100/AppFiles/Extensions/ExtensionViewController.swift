import Foundation
import MapKit
extension ViewController{
    
    func frameAndLayer(){
        infoView.layer.cornerRadius = 10
        infoView.layer.shadowOpacity = 0.4
        infoLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        
    }
    
}
