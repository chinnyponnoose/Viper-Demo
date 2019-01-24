//
//  NoticeProtocols.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/18/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import UIKit

protocol ViewToPresenterProtocol:class {
    var view:PresenterToViewProtocol? {get set}
    var interactor:PresenterToInteractorProtocol? {get set}
    var router:PresenterToRouterProtocol? {get set}
    func startFetchingNotice()
    func showMovieController(navigationController:UINavigationController)
}

protocol PresenterToViewProtocol:class {
    
    func showNotice (noticeArray:Array<NoticeModel>)
    func showError()
}

protocol PresenterToRouterProtocol : class{
    static func createModule() -> NoticeViewController
    func pushToMovieScreen(navigationConroller:UINavigationController)
}


protocol PresenterToInteractorProtocol :class{
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchNotice()
}

protocol InteractorToPresenterProtocol:class {
    func noticeFetchedSuccess(noticeModelArray:Array<NoticeModel>)
    func noticeFetchFailed()
}
