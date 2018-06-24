import UIKit

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    let groupingCellId = "groupingCellId"
    var menu:[Menu]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(GroupingCell.self, forCellWithReuseIdentifier: groupingCellId)
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        let menuFeed = "http://rtodd.net/swift/data/menu-pointslocal.json"
        
        MenuItems.downloadData(feedUrl: menuFeed) {  menu in
            self.menu = menu
            guard let menuItems = self.menu else { return }
            self.menuLauncher.items = menuItems
            self.setupNavBarButtons()
            
            print("menu: \(menu)")
        }
    }
    
    func setupNavBarButtons() {
        // imaged for UIBarButtonItems must me at size
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSearch))
        let menuButtonItem = UIBarButtonItem(image: UIImage(named: "bars")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(showMenu))
        navigationItem.leftBarButtonItems = [menuButtonItem]
        navigationItem.rightBarButtonItems = [searchBarButtonItem]
    }
    
    lazy var menuLauncher: MenuLauncher = {
        let launcher = MenuLauncher()
        launcher.pointsLocalController = self
        return launcher
    }()
    
    lazy var groupingCell: GroupingCell = {
        let controller = GroupingCell()
        controller.pointsLocalController = self
        return controller
    }()
    
    @objc func showMenu(){
        menuLauncher.showMenu()
        menuLauncher.pointsLocalController = self
    }
    
    func showController(item: Menu){
        print("show controller")
        guard let menuTitle = item.title else { return }

        let layout = UICollectionViewFlowLayout()
        
        if menuTitle == "Weather" {
            let weatherViewController = WeatherViewController(collectionViewLayout: layout)
            weatherViewController.menu = item
            navigationController?.pushViewController(weatherViewController, animated: true)
        } else {
            let whatToLoveViewController = WhatToLoveViewController(collectionViewLayout: layout)
            whatToLoveViewController.menu = item
            navigationController?.pushViewController(whatToLoveViewController, animated: true)
        }
    }
    
    func showArticleDetail() {
        print("maincontroller showarticledetail")
    }
    
    @objc func handleSearch(){
        print("search")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: groupingCellId, for: indexPath) as! GroupingCell
        cell.groupCellIndex = indexPath.item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 345 + (4 * 120) + 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

