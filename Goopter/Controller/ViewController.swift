//
//  ViewController.swift
//  Goopter
//
//  Created by Yilei Huang on 2019-06-07.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    var topView = TopStackView()
    var midView = CardStackView()
    var navView = CustoumNav()
    var productVC = CardVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpTopButton()
        setUpMidView()
        setUpNav()
    }
    
    fileprivate func setUpNav(){
        fetchLocation { (location) in
            self.navView.addressLabel.text = location.name
            UIView.animate(withDuration: 1, animations: {
                self.navView.addressLabel.alpha = 1
            })
            
        }
    }
    
    fileprivate func setUpMidView(){
        fetchMidView { (products) in
            //var double = false
            var productClone = products
             productClone.swapAt(2, 3)
//            for i in 0..<products.count{
//                productClone.swapAt(i, i+1)
//                if double == false{
//                    if products[i].width == 2{
//                        double = true
//                    }else{
//                       // productClone.swapAt(i, i+1)
//                    }
//                }else{
//
//                }
//
//            }
            self.midView.productArray = productClone
            print(products[0].name)
        }
    }
    
    @IBOutlet weak var tabbar: UITabBarItem!
    
    
    fileprivate func setUpTopButton(){
        
        fetchButton { (buttons) in
            if let url = URL(string: buttons[0].imgUrl!){
                SDWebImageManager.shared().loadImage(with: url, options: .continueInBackground, progress: nil) { (image, _, _, _, _, _) in
                    self.topView.restuarantBtn.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
                }
                self.topView.restuarantLable.text = buttons[0].name
                
            }
            if let url = URL(string: buttons[1].imgUrl!){
                SDWebImageManager.shared().loadImage(with: url, options: .continueInBackground, progress: nil) { (image, _, _, _, _, _) in
                    self.topView.shoppingBtn.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
                }
                self.topView.shoppingLabel.text = buttons[1].name
               
            }
            if let url = URL(string: buttons[2].imgUrl!){
                SDWebImageManager.shared().loadImage(with: url, options: .continueInBackground, progress: nil) { (image, _, _, _, _, _) in
                    self.topView.servicesBtn.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
                }
                self.topView.serviceLabel.text = buttons[2].name
               
            }
            if let url = URL(string: buttons[3].imgUrl!){
                self.topView.travelBtn.sd_setBackgroundImage(with: url, for: .normal, completed: nil)
                self.topView.travelLabel.text = buttons[3].name
            }
        }
    }
    
    
    fileprivate func setUpUI(){
        view.addSubview(navView)
        navView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        navView.heightAnchor.constraint(equalToConstant: AppDelegate.topHeight+50).isActive = true
        print(AppDelegate.topHeight)
        let overallStackView = UIStackView(arrangedSubviews: [topView,midView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        let tabBarHeight:CGFloat = (self.tabBarController?.tabBar.frame.size.height)!
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        print("tab bar height is ",self.tabBarController?.tabBar.frame.size.height)
        overallStackView.anchor(top: navView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 10, left: 12, bottom: 200, right: 12)
        
        
       
    }
    
    fileprivate func fetchMidView(completion:@escaping([Product])->Void){
        let urlString = "https://api-qa.goopter.com/api/v7/hlst?latlon=49.213366,-122.988651&lan=en&page=1&limit=20&city=1&c_id=1"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err{
                debugPrint("there is err ", err.localizedDescription)
                //completion(nil)
                return
            }
            guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []), let json = jsonData as? [String:Any] else {return}
            guard let recordsArray = json["records"] as? [[String:Any]] else{return}
            var buttonArray = [Product]()
            recordsArray.forEach({ (record) in
                var button: Product!
                button = Product(dictionary: record)
                buttonArray.append(button)
            })
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                completion(buttonArray)
            })
            
            
            }
            .resume()
    }
    
    
    fileprivate func fetchButton(completion:@escaping([Button])->Void){
        let urlString = "https://api-qa.goopter.com/api/v7/hs?city=1&lan=en"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err{
                debugPrint("there is err ", err.localizedDescription)
               //completion(nil)
                return
            }
            guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []), let json = jsonData as? [String:Any] else {return}
            guard let recordsArray = json["records"] as? [[String:Any]] else{return}
            var buttonArray = [Button]()
            recordsArray.forEach({ (record) in
                var button: Button!
                button = Button(dictionary: record)
                buttonArray.append(button)
            })
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                completion(buttonArray)
            })
            
            
        }
        .resume()
    }
    fileprivate func fetchLocation(completion:@escaping(Location)->Void){
        let urlString = "https://api-qa.goopter.com/api/v7/city?lan=en&cntry=1"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err{
                debugPrint("there is err ", err.localizedDescription)
                //completion(nil)
                return
            }
            guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []), let json = jsonData as? [String:Any] else {return}
            guard let recordsArray = json["records"] as? [[String:Any]] else{return}
            let locationData = recordsArray[0]
            var location = Location(dictionary: locationData)
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                completion(location)
            })
            
            
            }
            .resume()
    }


    
    

}

