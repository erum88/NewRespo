//
//  MainTableViewCell.swift
//  SimpleCreation
//
//  Created by Erum on 21/12/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var PicImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var picView: UIView!
    
    
    var resultImages = [listModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(data: inout [listModel], index: Int) {
        guard index < data.count else { return }
        let rowData = data[index]
        resultImages = data
        self.nameLabel.text = "AUTHOR: " + rowData.author!
        self.PicImage.setImageWith( "https://picsum.photos/200/300?image=\(rowData.id ?? 33)")
    }
}
