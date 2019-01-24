//
//  NoticeInteractor.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/18/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import UIKit


class NoticeInteractor:PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNotice () {
        let url  = NSURL(string: API_NOTICE_LIST)
        let task = URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            guard let _ = response else {
                self.presenter?.noticeFetchFailed()
             return
            }
            
            if let data = data {
                
                do {
                    if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
                        if let arrayResponse = jsonObj["notice_list"] as? [[String:Any]] {
                            var noticeModels :[NoticeModel] = Array()
                            for obj in arrayResponse {
                                let noticeModel  = NoticeModel(id: obj["id"] as! String  , title: obj["title"] as! String , brief: obj["brief"] as! String , filesource: obj["filesource"] as! String)
                                noticeModels.append(noticeModel)

                            }
                            self.presenter?.noticeFetchedSuccess(noticeModelArray: noticeModels)
                        }
                        
                    }
                } catch {
                    
                }
                
                
            }
            
        }
        task.resume()
    }
}
