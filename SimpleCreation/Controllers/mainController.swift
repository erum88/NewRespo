//
//  ViewController.swift
//  SimpleCreation
//
//  Created by Erum on 20/12/21.
//

import UIKit

class mainController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var resultImages = [listModel]()
    var mainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(nib: MainTableViewCell.loadNib(), withCellClass: MainTableViewCell.self)
      
        mainViewModel.apiCall{ data in
            self.resultImages.append(contentsOf: data)
            self.tableView.reloadData()
        }
       
    }
    
    
   
   

}


extension mainController: UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return resultImages.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withClass: MainTableViewCell.self, for: indexPath)
        cell.populateData(data: &self.resultImages, index: indexPath.row)
        
        return cell
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowData = resultImages[indexPath.row]
        
        let broadVC = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        broadVC.resultImages = [rowData]
        self.present(broadVC, animated:true, completion: nil)
       
    }
}
