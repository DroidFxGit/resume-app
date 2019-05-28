//
//  MainViewModel.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

// MARK: - MainViewModelDelegate protocol
protocol MainViewModelDelegate: class {
    func didShowError(error: Error)
}

// MARK: - MainViewModel class
class MainViewModel {
    
    // MARK: - Attributes
    private var service: ResumeService
    
    weak var delegate: MainViewModelDelegate?
    
    var isFetching =  false
    var resumeResponse: ResumeResponse? {
        didSet {
            updatedData()
        }
    }
    
    var updatedData: () -> Void = {}
    
    // MARK: - Initializers
    init(service: ResumeService = ResumeService()) {
        self.service = service
    }
    
    // MARK: - Main functions
    func fetchMainInfo() {
        if isFetching {
            return
        }
        
        isFetching = true
        service.fetchMainInfo { [weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.isFetching =  false
            
            switch response {
            case .success(let response):
                strongSelf.resumeResponse = response
            case .failure(let error):
                strongSelf.delegate?.didShowError(error: error)
            }
        }
    }
}
