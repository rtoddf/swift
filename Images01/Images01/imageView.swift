import UIKit

class imageView: UIView {

    override func drawRect(rect: CGRect) {
        let image = UIImage(named: "dlanceblack.jpg")
        var imageView: UIImageView!
        var scrollView: UIScrollView!
        
        imageView = UIImageView(image: UIImage(named: "dlanceblack.jpg"))
        imageView.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.width)
        
        scrollView = UIScrollView(frame: superview!.bounds)
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.addSubview(imageView)

        // Create UITextView
        let textView = UITextView(frame: CGRect(x: 0, y: bounds.size.width, width: bounds.size.width, height: bounds.size.width))
        textView.backgroundColor = UIColor.clearColor()
        
        
        // Define string attributes
        let font = UIFont(name: "Arial", size: 14.0) ?? UIFont.systemFontOfSize(14.0)
        let color = UIColor.whiteColor()
        let textFont = [NSFontAttributeName: font]
        let textColor = [NSForegroundColorAttributeName: color]
        
        // Create a string that will be our paragraph
        let para = NSMutableAttributedString()
//        para.addAttribute(NSStrokeColorAttributeName, value: UIColor.redColor(), range:  NSRange(location: 0, length: 1))
//        para.textColor = UIColor.whiteColor()
        
        
        
        // Create locally formatted strings
        let attrString1 = NSAttributedString(string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec sapien nec nisl finibus hendrerit. Vivamus efficitur massa nec maximus convallis. Quisque feugiat ex non cursus molestie. Nam imperdiet elit maximus nulla rhoncus, a auctor dui vulputate. Mauris et lacus porttitor, pharetra turpis eu, maximus leo. Proin quis luctus est. Praesent volutpat faucibus risus ut lobortis. Phasellus auctor malesuada erat, nec auctor diam feugiat nec. Vestibulum maximus, justo id rhoncus suscipit, ligula quam blandit urna, nec consequat lorem felis vitae tellus. Curabitur eu est nulla. Vestibulum a tincidunt neque. Sed lacinia neque feugiat, fringilla lacus ut, mattis est. Nunc nec egestas purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec sapien nec nisl finibus hendrerit. Vivamus efficitur massa nec maximus convallis. Quisque feugiat ex non cursus molestie. Nam imperdiet elit maximus nulla rhoncus, a auctor dui vulputate. Mauris et lacus porttitor, pharetra turpis eu, maximus leo. Proin quis luctus est. Praesent volutpat faucibus risus ut lobortis. Phasellus auctor malesuada erat, nec auctor diam feugiat nec. Vestibulum maximus, justo id rhoncus suscipit, ligula quam blandit urna, nec consequat lorem felis vitae tellus. Curabitur eu est nulla. Vestibulum a tincidunt neque. Sed lacinia neque feugiat, fringilla lacus ut, mattis est. Nunc nec egestas purus.", attributes:textFont)
        
        // Add locally formatted strings to paragraph
        para.appendAttributedString(attrString1)
        para.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor() , range: NSRange(location: 0, length: para.length))
        
        // Add string to UITextView
        textView.attributedText = para
        
        scrollView.addSubview(textView)
        
        scrollView.contentSize = CGSize(width: imageView.bounds.size.width, height: imageView.bounds.size.height + textView.bounds.size.height)
//        imageView.bounds.size
        
        self.addSubview(scrollView)
        
//        image!.drawInRect(CGRect(x: 0, y: 25, width: bounds.size.width, height: bounds.size.width))

        
//        var label = UILabel(frame: CGRectMake(30, bounds.size.width + 20, 320, bounds.size.width))
//        label.center = CGPointMake(300, 320)
//        label.textAlignment = NSTextAlignment.Center
//        label.numberOfLines = 0
//        label.preferredMaxLayoutWidth = 700
//        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        label.sizeToFit()
        
//        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec sapien nec nisl finibus hendrerit. Vivamus efficitur massa nec maximus convallis. Quisque feugiat ex non cursus molestie. Nam imperdiet elit maximus nulla rhoncus, a auctor dui vulputate. Mauris et lacus porttitor, pharetra turpis eu, maximus leo. Proin quis luctus est. Praesent volutpat faucibus risus ut lobortis. Phasellus auctor malesuada erat, nec auctor diam feugiat nec. Vestibulum maximus, justo id rhoncus suscipit, ligula quam blandit urna, nec consequat lorem felis vitae tellus. Curabitur eu est nulla. Vestibulum a tincidunt neque. Sed lacinia neque feugiat, fringilla lacus ut, mattis est. Nunc nec egestas purus."
//        self.addSubview(label)
    }
    

}
