//
//  DetailPresenter.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import Foundation
import FirebaseAnalytics

class DetailPresenter: ViewToPresenterDetailProtocol {

    var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?
    
    func pageLoaded(movieTitle:String) {
        let parameter = ["Title" : movieTitle]
        Analytics.logEvent("movie_detail_opened", parameters: parameter)
    }
    
}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    
}
