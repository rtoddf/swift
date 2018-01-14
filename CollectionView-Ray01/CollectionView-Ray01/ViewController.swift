// udemy section 21 - lecture 196

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView:UICollectionView!
    
    let segueIdentifier:String = "DetailSegue"
    let collectionViewCellIdentifier:String = "CollectionViewCell"
    var collectionData = ["1 😀", "2 💋", "3 😆", "4 😉", "5 😜", "6 🤪", "7 😕", "8 😣", "9 🤐", "10 😼", "11 ✋🏼", "12 🤧"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let destVC = segue.destination as? DetailViewController,
                let index = sender as? IndexPath {
                destVC.selection = collectionData[index.row]
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath)
        
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = collectionData[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifier, sender: indexPath)
    }
    
    
}
