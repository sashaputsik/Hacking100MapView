import Foundation
import MapKit
import UIKit
extension MapViewController{
    
    func frameAndLayer(){
        placeInfoView.layer.cornerRadius = 10
        placeInfoView.layer.shadowOffset = CGSize(width: 1,
                                                  height: 1)
        placeInfoView.layer.shadowOpacity = 0.5
        searchPlaceTableView.layer.cornerRadius = 10
        searchButton.layer.shadowOpacity = 0.4
        searchButton.layer.shadowOffset = CGSize(width: 1,
                                                 height: 1)
        searchButton.layer.cornerRadius = 10
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
