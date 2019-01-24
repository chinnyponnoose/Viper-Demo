//
//  MovieInteractor.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/22/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import Foundation

class MovieInteractor: presenterToInteractorMovieProtocol {
    
    var presenter:interactorToPresenterMovieProtocol?
    
    func fetchMovie() {
        
        let url = URL(string: API_MOVIE_LIST)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data , let _ = response  else {
               self.presenter?.movieFetchFailed()
             return
                
            }
            do {
                if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
                    if let arrayResponse = jsonObj["movie_list"] as? [[String:Any]] {
                        var movieModels :[MovieModel] = Array()
                        for obj in arrayResponse {
                            let movieModel  = MovieModel(id: obj["id"] as! String  , title: obj["title"] as! String , brief: obj["brief"] as! String , imagesource: obj["image_url"] as! String)
                            movieModels.append(movieModel)
                            
                        }
                        self.presenter?.movieFetchSuccess(movieList: movieModels)
                    }
                
                }
                
            }catch {
                
            }
            
        }
        task.resume()
        
        
    }
    
}
