import UIKit

class EventDetailCell:BaseCell {
    var event:Event? {
        didSet {
            guard let parentId = event?.parentId else { return }
            guard let headline = event?.headline else { return }
            guard let date = event?.date else { return }
            guard let startTime = event?.startTime else { return }
            guard let endTime = event?.endTime else { return }
            guard let venueName = event?.venueName else { return }
            guard let venueAddress = event?.venueAddress else { return }
            
            guard let parentCategoryName = event?.parentCategoryName else { return }
            
            imageView.loadPointsLocalImageUsingParentId(imageId: parentId)
            titleLabel.text = headline
            detailsLabel.text = date + " | " + startTime + "-" + endTime + "\n" + venueName + "\n" + venueAddress
        }
    }
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor(hexString: "#333333")
        return iv
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 3
        return label
    }()
    
    let detailsLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(hexString: "#777777")
        label.numberOfLines = 4
        return label
    }()
    
    override func setupViews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(detailsLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
        addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: titleLabel)
        addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: detailsLabel)
        addConstraintsWithFormat(format: "V:|[v0(\((9 / 16) * frame.width))]-8-[v1]-8-[v2]", views: imageView, titleLabel, detailsLabel)
    }
    
}
