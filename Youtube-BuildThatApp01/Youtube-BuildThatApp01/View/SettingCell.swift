import UIKit

class SettingCell:BaseCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            iconImageView.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
            print(isHighlighted)
        }
    }
    
    var setting:Setting? {
        didSet {
            nameLabel.text = setting?.name
            guard let imageName = setting?.imageName else { return }
            iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
            iconImageView.tintColor = UIColor.darkGray
        }
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let iconImageView:UIImageView  = {
        let iv = UIImageView()
        iv.image = UIImage(named: "settings")
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    override func setupViews() {
        super.setupViews()
        
        addSubview(iconImageView)
        addSubview(nameLabel)

        addConstraintsWithFormat(format: "H:|-8-[v0(30)]-8-[v1]|", views: iconImageView, nameLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(30)]-8-|", views: iconImageView)
        
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }

}
