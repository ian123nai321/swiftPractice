//
//  ViewController.swift
//  iOS Challenge3
//
//  Created by 吳政緯 on 2017/4/18.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    var products:[Product] = [Product(name:"Mac",price:1),Product(name:"apple",price:53),Product(name:"Banana",price:5),Product(name:"Can",price:99),Product(name:"Book",price:149),Product(name:"ApplePine",price:199),Product(name:"Pen",price:200)]
    var filteredProducts = [Product]()
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.dataSource = self
    }
    
    
    @IBAction func filter(_ sender: UIButton) {
        performSegue(withIdentifier: "popOverToFilterVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "popOverToFilterVC"{
            
            if let  destinationVC = segue.destination as? FilterViewController{
                
//                destinationVC.modalPresentationStyle = .popover
                
                //The delegate that handles popover-related messages.（37-43行皆是）
                destinationVC.popoverPresentationController?.delegate = self
                destinationVC.popoverPresentationController?.sourceView = self.productTableView
                destinationVC.popoverPresentationController?.sourceRect = CGRect(x: productTableView.bounds.width/2, y: productTableView.bounds.height/3, width: 0, height: 0)
                //取消popView的箭頭
                destinationVC.popoverPresentationController?.permittedArrowDirections = .init(rawValue: 0)
                destinationVC.popoverPresentationController?.canOverlapSourceViewRect = true
                destinationVC.preferredContentSize = CGSize(width: 300, height: 300)
                destinationVC.passSelectedRangeOfPrice = self
            }
        }
    }

}
extension ProductViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredProducts.count == 0  {
            return products.count
        }else{
            return filteredProducts.count
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        if filteredProducts.count == 0  {
            cell.textLabel?.text = products[indexPath.row].name
            
            return cell
        }else{
            cell.textLabel?.text = filteredProducts[indexPath.row].name
            return cell
        }
       
    }
}


extension ProductViewController:UIPopoverPresentationControllerDelegate{
    
    
    //讓iphone present as popOver的時候 popVC不會佔據全螢幕
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
    
        return UIModalPresentationStyle.none
    }
    
}


extension ProductViewController : PassSelectedRangeOfPriceDelegate{
    func pass(priceBound:[(Int,Int)]){
        filteredProducts = []
        var result = [Product]()
        for eachPriceBound in priceBound {
            let filteredProducts =  products.filter{product in return product.price > eachPriceBound.0}.filter{ product in return product.price < eachPriceBound.1}
            result += filteredProducts
        }
        filteredProducts = result
        print(filteredProducts)
        productTableView.reloadData()
    }
    
}
