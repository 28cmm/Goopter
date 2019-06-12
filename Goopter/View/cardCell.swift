//
//  cardCell.swift
//  Goopter
//
//  Created by Yilei Huang on 2019-06-07.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

class CustoumLabel:UILabel{
    override func draw(_ rect: CGRect) {
        super.drawText(in: rect)
        preferredMaxLayoutWidth = 125
        numberOfLines = 0
        font = UIFont(name: "Arial", size: 14)
    }
}

class cardCell: UICollectionViewCell {
    let nameLabel:CustoumLabel = {
        let label = CustoumLabel()
        return label
    }()
    
    let locationLabel = CustoumLabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    fileprivate func setUI(){
        addSubview(nameLabel)
        addSubview(locationLabel)
        nameLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 5, left: 5, bottom: 0, right: 0))
        locationLabel.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 0, bottom: 5, right: 5))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
