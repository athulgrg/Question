
import UIKit
import TinyConstraints

class ViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionHeadersPinToVisibleBounds = true
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        collectionView.edgesToSuperview()

        collectionView.register(UINib(nibName: "OneCell", bundle: .main), forCellWithReuseIdentifier: "OneCell")
        collectionView.register(UINib(nibName: "TwoCell", bundle: .main), forCellWithReuseIdentifier: "TwoCell")
        collectionView.register(UINib(nibName: "TwoHeader", bundle: .main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TwoHeader")
        collectionView.register(UINib(nibName: "TwoFooter", bundle: .main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TwoFooter")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let oneCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneCell", for: indexPath) as? OneCell {
                oneCell.setData()
                return oneCell
            }
        }
        if let twoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoCell", for: indexPath) as? TwoCell {
            return twoCell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.zero
        }
        return CGSize(width: collectionView.frame.size.width, height: 96)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.zero
        }
        return CGSize(width: collectionView.frame.size.width, height: 96)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 1 {
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TwoHeader", for: indexPath) as? TwoHeader {
                return header
            }
        }
        if kind == UICollectionView.elementKindSectionFooter && indexPath.section == 1 {
            if let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TwoFooter", for: indexPath) as? TwoFooter {
                return footerView
            }
        }
        return UICollectionReusableView()
    }

    // IS THIS METHOD EVEN NEEDED FOR SITUATION SIZE CALCULATION US AUTOMATIC?
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.section == 0 {
//            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
//        }
//        return CGSize(width: (collectionView.frame.size.width - 12) / 2, height: 150)
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 4, left: 4,  bottom: 4, right: 4)
    }
}
