/*
    Swift: Create a Questionnaire App using UITableView Programmatically (Part 1)
    https://www.youtube.com/watch?v=yl2m4fDOLQo
 
    Swift: Create a Questionnaire App using UITableView Programmatically (Part 2)
    https://www.youtube.com/watch?v=iLIieGckVKs
*/

import UIKit

class QuestionController: UITableViewController {
    
    let cellId = "cellId"
    let headerId = "headerId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Question"
        navigationController?.navigationBar.tintColor = .white
        
        tableView.rowHeight = 50
        tableView.sectionHeaderHeight = 50
        tableView.register(QuestionHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.register(AnswerCell.self, forCellReuseIdentifier: cellId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ResultsController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

class ResultsController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews(){
        let resultsLabel:UILabel = {
            let label = UILabel()
            label.text = "Congratulations? You're a total Ross"
            label.font = UIFont(name: "AvenirNext-Bold", size: 16)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(resultsLabel)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultsLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultsLabel]))
    }
}

class QuestionHeader:UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        let nameLabel:UILabel = {
            let label = UILabel()
            label.text = "Question One"
            label.font = UIFont(name: "AvenirNext-Bold", size: 15.0)

//            func printFonts() {
//                let fontFamilyNames = UIFont.familyNames
//                for familyName in fontFamilyNames {
//                    print("------------------------------")
//                    print("Font Family Name = [\(familyName)]")
//                    let names = UIFont.fontNames(forFamilyName: familyName)
//                    print("Font Names = [\(names)]")
//                }
//            }
//
//            printFonts()
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        addSubview(nameLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
}

class AnswerCell:UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        let nameLabel:UILabel = {
            let label = UILabel()
            label.text = "Sample Answer"
            label.font = UIFont(name: "AvenirNext-Medium", size: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        addSubview(nameLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
}













