//
//  MedicalSuppliesInteractorIO.swift
//  storemed
//
//  Created by pragmus on 03/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import Foundation

protocol MedicalSuppliesInteractorInput: AnyObject {
    
    func requestMedicalSupplies(_ query: String, currentPageNumber: Int)
    
}

protocol MedicalSuppliesInteractorOutput: AnyObject {
    
    func sendPageCopy(_ page: Page?)
    func sendErrorInfo(_ errorInfo: String?)
    
}
