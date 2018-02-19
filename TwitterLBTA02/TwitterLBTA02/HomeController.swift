//  ep 1 - https://www.youtube.com/watch?v=2fcf9yFe944&index=1&list=PL0dzCUj1L5JE1wErjzEyVqlvx92VN3DL5
// ep 2 - https://www.youtube.com/watch?v=9ZCoLepLu0w&index=2&list=PL0dzCUj1L5JE1wErjzEyVqlvx92VN3DL5
// ep 3 - https://www.youtube.com/watch?v=wN_vhAjnGvo&index=3&list=PL0dzCUj1L5JE1wErjzEyVqlvx92VN3DL5

import UIKit

class HomeController:UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerCellId = "headerId"
    let footerCellId = "footerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath)
            header.backgroundColor = .green
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerCellId, for: indexPath)
            footer.backgroundColor = .green
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

}

class CustomCell:UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let wordLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test"
        return label
    }()
    
    func setupViews() {
        backgroundColor = .orange
        addSubview(wordLabel)
        
        wordLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        wordLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        wordLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        wordLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}











