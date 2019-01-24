//
//  MovieModel.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/22/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import Foundation

class MovieModel :Codable {
    
    var id :String?
    var title:String?
    var brief:String?
    var imagesource:String?
    
    init(id:String,title:String,brief:String,imagesource:String) {
        
        self.id = id
        self.title = title
        self.brief = brief
        self.imagesource = imagesource
    }
}
