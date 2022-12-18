//
//  LoginViewModel.swift
//  MVVM_DEMO
//
//  Created by Vishal Kumar on 18/12/22.
//

import Foundation

class LoginViewModel {
    
    var BindDataChanges:((Bool,Bool) -> Void)?
    
    var responseData:[LoginDataModel]? {
        didSet {
            self.BindDataChanges!(true,false)
        }
    }
    
    func getLoginData()  {
        NetworkHelper.sharedInstance.fetchLoginData { result in
            switch result {
            case .success(let data):
                let mappedData = try? JSONDecoder().decode([LoginDataModel].self, from: data) as [LoginDataModel]
                self.responseData = mappedData
                break
                
            case .failure(let error):
                print(error.description)
                break
            }
        }
    }
}
