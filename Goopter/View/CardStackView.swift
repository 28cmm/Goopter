import UIKit
class CardStackView:UIView{
    
    let cardVC = CardVC()
    var productArray:[Product]!{
        didSet{
            cardVC.ProductArray = self.productArray
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        let midViewControl = cardVC.view!
        midViewControl.contentMode = .scaleAspectFill
        addSubview(midViewControl)
        midViewControl.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
