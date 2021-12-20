//
//  API.swift
//  SimpleCreation
//
//  Created by Erum on 20/12/21.
//

import Foundation
import Moya
import Alamofire



func printDebug<T>(_ obj: T) {
    //MARK:- Comment Line to disable all logs
    print(obj)
}
internal typealias CompletionHandler<T> = (_ result: T?, _ error: Swift.Error?) -> Void

class DefaultAlamofireSession: Alamofire.Session {
    static let shared: DefaultAlamofireSession = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 60 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 60 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireSession(configuration: configuration)
    }()
}

class API {
    
    static private let provider = MoyaProvider<ImageAPI>(session: DefaultAlamofireSession.shared)
    
    static func getImageListAPI(completion: @escaping CompletionHandler<[listModel]>) {
        
        provider.request(.getImage(id: "")) { (result) in
            
            switch result {
            case .success(let response):
                printRequest(response)
                
                let decoder = JSONDecoder()
//                let df = DateFormatter.dateFormatter
//                df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//                decoder.dateDecodingStrategy = .formatted(df)
                
                do {
                    let data = try decoder.decode([listModel].self, from: response.data)
                    completion(data, nil)
                    
                } catch let error {
                    guard let errorValue = try? decoder.decode(ErrorModel.self, from: response.data) else {
                        printDebug("Error:- \n \(error)")
                        completion(nil, error)
                        return
                    }
                    printDebug(errorValue)
                 
                 //   AKAlertController.alert("image", message: errorValue.errorMessage)
               //     completion(nil, NSError(domain: errorValue.errorMessage, code: 400))
                }
                
            case .failure(let error):
                printDebug(error)
                completion(nil, error)
            }
        }
        
    }
    
    
}
extension API {
    
    private static func printRequest(_ response: Response) {
        printDebug(
            """
            \n
            API Request:-
            --------------
            URL         : \(response.request?.url?.absoluteString ?? "")
            Headers     : \(response.request?.allHTTPHeaderFields ?? [:])
            HTTP Method : \(response.request?.httpMethod ?? "")
            Parameters  : \(String(bytes: response.request?.httpBody ?? Data(), encoding: .utf8) ?? "")
            
            Response    : \((try? response.mapString()) ?? "")
            \n\n
            """
        )
    }
}

