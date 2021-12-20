//
//  SimpleCreationAPI.swift
//  SimpleCreation
//
//  Created by Erum on 20/12/21.
//

import Foundation
import Moya
import AVFoundation

internal typealias JSONDictionary = [String: Any]
internal typealias JSONArray = [JSONDictionary]

enum ImageAPI {
    
    case getImage(id: String)
    
}
var BASE_URL = "https://picsum.photos/"

extension ImageAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: BASE_URL) else {
            fatalError("baseURL could not be configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getImage:
        return "list"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getImage:
            return .requestPlain
            
        default:
            return .requestPlain
       }
    }
    var headers: [String : String]? {
        return .none
    }
    

    
}
extension Data {
    func sizeString(units: ByteCountFormatter.Units = [.useAll], countStyle: ByteCountFormatter.CountStyle = .file) -> String {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = units
        bcf.countStyle = .file
        
        return bcf.string(fromByteCount: Int64(count))
    }
}
