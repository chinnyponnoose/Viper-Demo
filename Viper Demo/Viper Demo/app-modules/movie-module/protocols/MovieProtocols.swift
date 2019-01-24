//
//  MovieProtocols.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/22/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import Foundation

protocol viewToPresenterMovieProtocol:class {
    var view:presenterToViewMovieProtocol? {get set}
    var interactor :presenterToInteractorMovieProtocol? {get set}
    var router:presenterToRouterMovieProtocol? {get set}
    func startFetchingData()
    
}

protocol presenterToViewMovieProtocol:class {
    func onMovieResponseSuccess(movieModelArrayList:Array<MovieModel>)
    func onMovieResponseFailed(error:String)
}

protocol presenterToInteractorMovieProtocol:class {
    
    var presenter:interactorToPresenterMovieProtocol? {get set}
    func fetchMovie()
    
}

protocol interactorToPresenterMovieProtocol:class {
    func movieFetchSuccess(movieList:Array<MovieModel>)
    func movieFetchFailed()
    
}
protocol presenterToRouterMovieProtocol:class {
    static func createMovieModule () -> MovieViewController
}
