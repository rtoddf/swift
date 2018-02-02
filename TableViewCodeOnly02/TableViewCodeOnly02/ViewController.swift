/*
    Swift: Create a Questionnaire App using UITableView Programmatically (Part 1)
    https://www.youtube.com/watch?v=yl2m4fDOLQo
 
    Swift: Create a Questionnaire App using UITableView Programmatically (Part 2)
    https://www.youtube.com/watch?v=iLIieGckVKs
*/

import UIKit

struct Question {
    var questionString:String?
    var answers:[String?]
    var selectedAnswerIndex:Int?
}

class QuestionController: UITableViewController {
    
    let cellId = "cellId"
    let headerId = "headerId"
    
    var question = Question(questionString: "What is your favorite type of food?", answers: ["Pizza", "Burgers", "Seafood", "Sushi"], selectedAnswerIndex: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Question"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
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
        return question.answers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AnswerCell
        
        if let answer = question.answers[indexPath.row] {
            cell.nameLabel.text = answer
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! QuestionHeader
        header.nameLabel.text = question.questionString
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        question.selectedAnswerIndex = indexPath.row
        
        let controller = ResultsController()
        controller.question = question
        navigationController?.pushViewController(controller, animated: true)
    }
}

class ResultsController:UIViewController {
    var question:Question? {
        didSet {
            let names = ["Bob", "Sam", "Barb", "Mike", "Tim"]
            if let index = question?.selectedAnswerIndex {
                resultsLabel.text = "Congratulations? You're a total \(names[index])"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    let resultsLabel:UILabel = {
        let label = UILabel()
        label.text = "Congratulations? You're a total Ross"
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews(){
        navigationItem.title = "Results"
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
    
    func setupViews(){
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
    
    var nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Sample Answer"
        label.font = UIFont(name: "AvenirNext-Medium", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews(){
        addSubview(nameLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
}
