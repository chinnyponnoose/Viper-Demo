//
//  NoticeModel.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/18/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import UIKit

class NoticeModel :Codable {
    
    var id :String?
    var title:String?
    var brief:String?
    var filesource:String?
    
    init(id:String,title:String,brief:String,filesource:String) {
        
        self.id = id
        self.title = title
        self.brief = brief
        self.filesource = filesource
    }
}
