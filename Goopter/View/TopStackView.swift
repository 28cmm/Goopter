
import UIKit
class TopStackView: UIStackView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
    }
    func setUI(){
        heightAnchor.constraint(equalToConstant: 75).isActive = true
        distribution = .equalCentering
        let rest = UIStackView(arrangedSubviews: [restuarantBtn,restuarantLable])
        rest.axis = .vertical
        rest.spacing = 0
        restuarantLable.heightAnchor.constraint(equalToConstant: 17).isActive = true
        restuarantLable.font = UIFont(name: "Arial", size: 11)
        restuarantLable.textColor = .init(white: 0.3, alpha: 0.6)
        restuarantLable.textAlignment = .center
        
        
       let shop = UIStackView(arrangedSubviews: [shoppingBtn,shoppingLabel])
        shop.axis = .vertical
        rest.spacing = 0
        shoppingLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        shoppingLabel.font = UIFont(name: "Arial", size: 12)
        shoppingLabel.textColor = .init(white: 0.3, alpha: 0.6)
        shoppingLabel.textAlignment = .center
        
        let service = UIStackView(arrangedSubviews: [servicesBtn,serviceLabel])
        service.axis = .vertical
        service.spacing = 0
        serviceLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        serviceLabel.font = UIFont(name: "Arial", size: 12)
        serviceLabel.textColor = .init(white: 0.3, alpha: 0.6)
        serviceLabel.textAlignment = .center
        
        let travel = UIStackView(arrangedSubviews: [travelBtn,travelLabel])
        travel.axis = .vertical
        travel.spacing = 0
        travelLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        travelLabel.font = UIFont(name: "Arial", size: 12)
        travelLabel.textColor = .init(white: 0.3, alpha: 0.6)
        travelLabel.textAlignment = .center
        
        
        let subViews = [rest,shop,service,travel]
        subViews.forEach { (v) in
            addArrangedSubview(v)
            v.heightAnchor.constraint(equalToConstant: 44).isActive = true
            v.widthAnchor.constraint(equalToConstant: 55).isActive = true
        }
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    let restuarantBtn = UIButton(type: .system)
    let restuarantLable = UILabel()
    
    let shoppingBtn = UIButton(type: .system)
    let shoppingLabel = UILabel()
    
    let servicesBtn = UIButton(type: .system)
    let serviceLabel = UILabel()
    
    let travelBtn = UIButton(type: .system)
    let travelLabel = UILabel()
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
