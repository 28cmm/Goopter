//
//  CardVC.swift
//  Goopter
//
//  Created by Yilei Huang on 2019-06-07.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

extension CardVC:UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // print(ProductArray.count)
        return ProductArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! cardCell
        var index = ProductArray[indexPath.row]
        cell.locationLabel.text = index.city
        cell.nameLabel.text = index.name
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        print("User tapped on item \(indexPath.row)")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let index = ProductArray[indexPath.row]
        if index.width == 2{
            return .init(width: myCollectionView.frame.width/2 - 20, height: 300)
            
        }else{
            return .init(width: myCollectionView.frame.width - 40, height: 300)
            
        }
        
    }
    
}

class CardVC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var double2 = true
    var skippedNum = 0
    var ProductArray = [Product](){
        didSet{
            myCollectionView.reloadData()
        }
    }
    let layout = UICollectionViewFlowLayout()
    var myCollectionView:UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        //layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 60, height: 60)
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(cardCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(myCollectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
