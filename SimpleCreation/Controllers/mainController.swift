//
//  ViewController.swift
//  SimpleCreation
//
//  Created by Erum on 20/12/21.
//

import UIKit

class mainController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var resultImages = [listModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiCall()
    }
    
    
    func apiCall() {
        
        API.getImageListAPI{ (result, error) in
            guard let data = result else {return}
            defer{self.tableView.reloadData()}
              self.resultImages.append(contentsOf: data)
        }
    }
    
    //MARK:- TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return resultImages.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableviewCell",for: indexPath) as! ImageTableviewCell
        cell.selectionStyle = .none
        
        let rowData = resultImages[indexPath.row]
        
        cell.picView.dropShadow()
        
        cell.PicImage.setImageWith( "https://picsum.photos/200/300?image=\(rowData.id ?? 33)")
       
        cell.nameLabel.text = "AUTHOR: " +  rowData.author!
        
    
        
        return cell
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowData = resultImages[indexPath.row]
        
        let broadVC = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        broadVC.resultImages = [rowData]
        self.present(broadVC, animated:true, completion: nil)
       
    }

}

class ImageTableviewCell : UITableViewCell{
    
    @IBOutlet weak var PicImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var picView: UIView!

}
