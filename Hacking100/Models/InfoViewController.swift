import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var placeTitleView: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var disciplineLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var creator = ""
    var placeTitle = ""
    var location = ""
    var discipline = ""
    var descriptionInfo = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        placeTitleView.text = placeTitle
        creatorLabel.text = creator
        locationLabel.text = location
        disciplineLabel.text = discipline
        descriptionTextView.text = descriptionInfo
    }


}
