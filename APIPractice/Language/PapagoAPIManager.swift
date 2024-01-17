//
//  PapagoAPIManager.swift
//  APIPractice
//
//  Created by 은서우 on 2024/01/18.
//

import UIKit
import Alamofire

struct PapagoAPIManager {
    
    func callRequest(text: String, completionHandler: @escaping (Language) -> Void){
        
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        let parameters: Parameters = [
            "text" : text,
            "source": "ko",
            "target": "en"]
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.clientID,
            "X-Naver-Client-Secret": APIKey.clientSecret]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   headers: headers).responseDecodable(of: Language.self) { response in
            switch response.result {
            case .success(let success):
                dump(success)
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
}
