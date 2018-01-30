import UIKit

class BaseCell:UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class StoryCell:BaseCell {
    var story:Story?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let leadImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "newsEngin.21079913")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let headlineLabel:UILabel = {
        let label = UILabel()
        let titleColor = UIColor(hexString: "#333333")
        label.text = "Mayor on fighting Good Sam closure: ‘We’re looking at all our options’"
        label.textColor = titleColor
        return label
    }()
    
    let textLabel:UITextView = {
        let tl = UITextView()
        let textColor = UIColor(hexString: "#707070")
        tl.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        tl.text = "Mayor on fighting Good Sam closure: ‘We’re looking at all our options’"
        tl.textColor = textColor
        return tl
    }()
    
    let dividerLine:UIView = {
        let dl = UIView()
        let textColor = UIColor(hexString: "#333333")
        dl.backgroundColor = textColor
        return dl
    }()
    
    override func setupViews(){
        addSubview(leadImageView)
        addSubview(headlineLabel)
        addSubview(textLabel)
        addSubview(dividerLine)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: leadImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: headlineLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: textLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLine)
        
        addConstraintsWithFormat(format: "V:|[v0]-8-[v1(20)]-4-[v2(30)]-16-[v3(1)]|", views: leadImageView, headlineLabel, textLabel, dividerLine)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
