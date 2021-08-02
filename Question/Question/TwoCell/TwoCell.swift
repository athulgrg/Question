
import UIKit

class TwoCell: UICollectionViewCell {

    override func preferredLayoutAttributesFitting(
        _ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {

        // Full width - 3 times the collectionview padding (left inset(4) + right inset(4) + centre interim space(4))
        let width = (UIApplication.shared.windows[0].bounds.width - 12) / 2
        let targetSize = CGSize(width: width, height: 150)
        layoutAttributes.frame.size = targetSize
        return layoutAttributes
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }
}
