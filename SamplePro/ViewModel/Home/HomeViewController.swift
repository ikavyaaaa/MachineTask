//
//  HomeViewController.swift
//  SamplePro
//
//  Created by Kavya on 02/07/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let serviceObj = ServiceConnection()
    var dataArray: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //Custom UI
    func setupUI() {
        //UI
        viewSearch.layer.borderWidth = 0.5
        viewSearch.layer.cornerRadius = 5
        viewSearch.layer.borderColor = UIColor.lightGray.cgColor
        tableView.delegate = self
        tableView.dataSource = self
        //Service call and added the data to global Array
        serviceObj.GetData() { (response) in
            if let resp = response["homeData"] as? NSArray {
                self.dataArray = resp
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dict : [String : Any] = self.dataArray[indexPath.row] as! [String : Any]
        if dict["type"] as! String == "category" {
            return 120
        } else if dict["type"] as! String == "banners" {
            return 201
        } else if dict["type"] as! String == "products" {
            return 285
        } else {
        return 100
        }
    }
}
//MARK: - TableView DataSource and Delegate
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dict : [String : Any] = self.dataArray[indexPath.row] as! [String : Any]
        if dict["type"] as! String == "category" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
            cell.dict = dict
            cell.collectionView.reloadData()
            return cell
        } else if dict["type"] as! String == "banners" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannersCell") as! BannersCell
            cell.dict = dict
            cell.collectionView.reloadData()
            return cell
        } else if dict["type"] as! String == "products" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell") as! ProductsCell
            cell.dict = dict
            cell.collectionView.reloadData()
            return cell
        } else {
        let cell = UITableViewCell()
        cell.contentView.backgroundColor = .red
        return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
