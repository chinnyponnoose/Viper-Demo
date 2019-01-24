//
//  NoticeRouter.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/17/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import Foundation
import UIKit

class NoticeRouter :PresenterToRouterProtocol {
    
    static func createModule () -> NoticeViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "NoticeViewController") as! NoticeViewController
        
        let presenter:ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
        let interactor:PresenterToInteractorProtocol = NoticeInteractor() 
        let router:PresenterToRouterProtocol = NoticeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard:UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func pushToMovieScreen(navigationConroller:UINavigationController) {
        let movieModule =  MovieRouter.createMovieModule()
        navigationConroller.pushViewController(movieModule, animated: true)
    }
    

}
