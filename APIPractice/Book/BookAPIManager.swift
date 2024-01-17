//
//  BookAPIManager.swift
//  APIPractice
//
//  Created by 은서우 on 2024/01/17.
//

import Foundation
import Alamofire

struct BookAPIManager {
    func callRequest(text: String, completionHandler: @escaping ([Document]) -> Void){
        
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = "https://dapi.kakao.com/v3/search/book?query=\(text)"
        let headers: HTTPHeaders = ["Authorization": APIKey.kakao]
        
        AF.request(url,
                   method: .get,
                   headers: headers).responseDecodable(of: Book.self) { response in
            switch response.result {
            case .success(let success):
                dump(success)
                completionHandler(success.documents)
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
}

