// https://www.youtube.com/watch?v=3Xv1mJvwXok - 32:31

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(StoryCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewlayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }

}

class StoryCell:UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let leadImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        return imageView
    }()
    
    let siteIconImageView:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor(hexString: "#003264")
        return iv
    }()
    
    let headlinelabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(hexString: "#ae0000")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    func setupViews() {
        addSubview(leadImageView)
        addSubview(separatorView)
        addSubview(siteIconImageView)
        addSubview(headlinelabel)

        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: leadImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: siteIconImageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: leadImageView, siteIconImageView, separatorView)
        
        addConstraint(NSLayoutConstraint(item: headlinelabel, attribute: .top, relatedBy: .equal, toItem: leadImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: headlinelabel, attribute: .leading, relatedBy: .equal, toItem: siteIconImageView, attribute: .trailing, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: headlinelabel, attribute: .trailing, relatedBy: .equal, toItem: leadImageView, attribute: .trailing, multiplier: 1, constant: 1))
        addConstraintsWithFormat(format: "V:[v0(20)]", views: headlinelabel)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: headlinelabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func addConstraintsWithFormat(format:String, views:UIView...) {
        var viewsDictionary = [String:UIView]()
        for (index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}







