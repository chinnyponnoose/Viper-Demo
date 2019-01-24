//
//  NoticePresenter.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/18/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//
import Foundation
import UIKit

class NoticePresenter:ViewToPresenterProtocol {
    
    var view:PresenterToViewProtocol?
    var interactor:PresenterToInteractorProtocol?
    var router:PresenterToRouterProtocol?
    
    func startFetchingNotice() {
        interactor?.fetchNotice()
    }
    func showMovieController(navigationController:UINavigationController) {
        router?.pushToMovieScreen(navigationConroller: navigationController)
    }
    

}

extension NoticePresenter:InteractorToPresenterProtocol {
    
    func noticeFetchedSuccess(noticeModelArray:Array<NoticeModel>) {
        self.view?.showNotice(noticeArray: noticeModelArray)
        
    }
    func noticeFetchFailed() {
        self.view?.showError()
    }
    
}
