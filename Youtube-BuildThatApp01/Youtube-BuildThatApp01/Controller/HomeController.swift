// Swift: Lets Build YouTube - Home Feed: UICollectionView, AutoLayout (Ep 1)
// https://www.youtube.com/watch?v=3Xv1mJvwXok - DONE
// Swift: YouTube - Custom Navigation Bar and MVC Clean Up (Ep 2)
// https://www.youtube.com/watch?v=APQVltARKF8 - DONE
// Swift: Youtube - Custom Tab Bar / Menu Bar using UICollectionView (Ep 3)
// https://www.youtube.com/watch?v=rRhJGnSmEKQ - DONE
// Swift: YouTube - MVC Explained: Model View Controller (Ep 4)
// https://www.youtube.com/watch?v=Zud56x_VYvs&list=PL0dzCUj1L5JGKdVUtA5xds1zcyzsz7HLj&index=4
// Swift: YouTube - REST JSON Integration via NSURLSession (Ep 5)
// https://www.youtube.com/watch?v=WjrvcGAZfoI&list=PL0dzCUj1L5JGKdVUtA5xds1zcyzsz7HLj&index=5

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false

        let titleLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: view.frame.width, height: view.frame.height)))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel

        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        // pushes down the collectionview so the menubar isn't overlaying it
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setUpMenuBar()
        
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        // imaged for UIBarButtonItems must me at size
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSearch))
        let moreButtonItem = UIBarButtonItem(image: UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButtonItem, searchBarButtonItem]
    }
    
    @objc func handleSearch(){
        print("search")
    }
    
    @objc func handleMore(){
        print("more")
    }
    
    let menuBar:MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setUpMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    // remember the UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // CGSizeMake is no longer available in Swift
//        let size = CGSize(width: view.frame.width, height: 200)
        
        // width minus left margin minus right marging divided by the ratio - 16x9
        let height = (view.frame.width - 16 - 16) * 9/16
        // you need to add the top 16 and bottom 68
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
    
    // removes the spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
