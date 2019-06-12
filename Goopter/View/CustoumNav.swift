//
//  CustoumNav.swift
//  Goopter
//
//  Created by Yilei Huang on 2019-06-08.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

class CustoumNav: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    fileprivate func setUp(){
        //let window = UIApplication.shared.windows[0]
       // let safeFrame = window.safeAreaLayoutGuide.layoutFrame
        //heightAnchor.constraint(equalToConstant: 50+AppDelegate.topHeight).isActive = true
       addSubview(addressLabel)
        addSubview(rightScanBtn)
        //print(AppDelegate.topHeight)
        addressLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: 40, bottom: 0, right: 0))
        addressLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 20).isActive = true
        
        rightScanBtn.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 10),size: .init(width: 30, height: 30))
        rightScanBtn.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 20).isActive = true
        backgroundColor = #colorLiteral(red: 0.9770398736, green: 0.1508616507, blue: 0.1605219245, alpha: 1)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var addressLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "gg"
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.alpha = 0
        return label
    }()
    
    var rightScanBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "scan").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()

}
