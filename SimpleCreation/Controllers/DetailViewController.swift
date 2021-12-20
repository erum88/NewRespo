//
//  DetailViewController.swift
//  SimpleCreation
//
//  Created by Erum on 20/12/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var PicImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var resultImages = [listModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        self.PicImage.setImageWith( "https://picsum.photos/200/300?image=\(resultImages.first?.id ?? 33)")
        self.nameLabel.text = resultImages.first?.author
        self.detailLabel.text = resultImages.first?.author_url
    }
    
    @IBAction func backBtnAction(_ sender: UIButton){
        
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
