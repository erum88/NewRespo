//
//  MainViewModel.swift
//  SimpleCreation
//
//  Created by Erum on 21/12/21.
//

import Foundation
import UIKit


class MainViewModel: NSObject{
    
    var resultImages = [listModel]()
    
    func apiCall(comp: @escaping ([listModel]) -> ()) {
        
        API.getImageListAPI{ [weak self] (result, error) in
            guard let data = result else {return}
            
            self?.resultImages.append(contentsOf: data)
            comp(self!.resultImages)
        }
    }
    
    
}
