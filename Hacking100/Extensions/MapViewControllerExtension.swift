import Foundation
import MapKit
import UIKit
extension MapViewController{
    
    func frameAndLayer(){
        placeInfoView.layer.cornerRadius = CGFloat(Appearance().cornerRadius)
        placeInfoView.layer.shadowOffset = Appearance().shadowOffset
        placeInfoView.layer.shadowOpacity = Float(Appearance().shadowOpacity)
        searchPlaceTableView.layer.cornerRadius = CGFloat(Appearance().cornerRadius)
        searchButton.layer.shadowOpacity = Float(Appearance().shadowOpacity)
        searchButton.layer.shadowOffset = Appearance().shadowOffset
        searchButton.layer.cornerRadius = CGFloat(Appearance().cornerRadius)
        }
    
    
    func setInfoView(isHidden: Bool){
        self.placeTitleLabel.isHidden = isHidden
        self.placeDisciplineLabel.isHidden = isHidden
        self.placeDescriptionTextView.isHidden = isHidden
        self.placeLocationLabel.isHidden = isHidden
        self.locationImageView.isHidden = isHidden
        self.closeInfoViewButton.isHidden = isHidden
    }
    
    func setPlaceViewInformation(title: String?,
                                 location: String,
                                 discipline: String,
                                 descriptionInfo: String){
        placeTitleLabel.text = title
        placeLocationLabel.text = location
        placeDisciplineLabel.text = discipline
        placeDescriptionTextView.text = descriptionInfo
    }
}

private extension MapViewController{
    
    struct Appearance {
        let cornerRadius = 10
        let shadowOpacity = 0.5
        let shadowOffset = CGSize(width: 1, height: 1)
    }
}
