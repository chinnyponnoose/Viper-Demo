//
//  MovieRouter.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/22/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import Foundation
import UIKit

class MovieRouter :presenterToRouterMovieProtocol {
    
    static func createMovieModule () -> MovieViewController {
        
        let view = MovieRouter.storyboard.instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
        let presenter:viewToPresenterMovieProtocol & interactorToPresenterMovieProtocol = MoviePresenter()
        let interactor:presenterToInteractorMovieProtocol = MovieInteractor()
        let router:presenterToRouterMovieProtocol = MovieRouter()
        
        view.moviePresenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        interactor.presenter = presenter
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    
}
