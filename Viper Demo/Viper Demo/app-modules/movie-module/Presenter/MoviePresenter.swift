//
//  MoviePresenter.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/22/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import Foundation

class MoviePresenter:viewToPresenterMovieProtocol {
    
    var view:presenterToViewMovieProtocol?
    var interactor :presenterToInteractorMovieProtocol?
    var router:presenterToRouterMovieProtocol?
    
    func startFetchingData() {
        
        interactor?.fetchMovie()
        
    }
    
}
extension MoviePresenter:interactorToPresenterMovieProtocol {
    
    func movieFetchSuccess(movieList: Array<MovieModel>) {
        view?.onMovieResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error message from api response")
    }
    
    
}
