
import UIKit
class TwoFooter: UICollectionReusableView {
    @IBOutlet weak var footerLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        footerLabel.text = "TWO FOOTER"

    }
}
