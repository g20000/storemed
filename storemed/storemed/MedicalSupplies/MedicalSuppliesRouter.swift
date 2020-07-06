//
//  Router.swift
//  storemed
//
//  Created by pragmus on 01/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesRouter: NSObject {
    
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    init(_ window: UIWindow?) {
        super.init()
        
        self.window = window
        self.navigationController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as? UINavigationController
        createAppModules()
        window?.rootViewController = navigationController
    }
    
    private func createAppModules() {
        createMedicalSuppliesList()
        _ = createNewsItemViewController()
    }
    
    private func createMedicalSuppliesList() {
        
        let view = navigationController?.viewControllers.first as! MedicalSuppliesViewController
        let presenter = MedicalSuppliesPresenter()
        let interactor = MedicalSuppliesInteractor()
        
        view.presenter = presenter
        presenter.view = view
        
        presenter.interactor = interactor
        interactor.output = presenter
        
        interactor.dataCacher = DataCacher()
        
    }
    
    private func createNewsItemViewController() -> NewsItemWebViewController {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:"NewsItemWeb") as! NewsItemWebViewController
        let presenter = NewsItemWebViewPresenter()
        let interactor = NewsItemWebViewInteractor()

        view.presenter = presenter
        presenter.view = view

        presenter.interactor = interactor
        interactor.output = presenter
        
        return view
    }
}
