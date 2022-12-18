//
//  HomeViewController.swift
//  MVVM_DEMO
//
//  Created by Vishal Kumar on 18/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tblLoginData: UITableView!
    var viewModel:LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        fetchLoginData()
        prepareViewModelObserver()
        
    }
    
    func registerCell()  {
        self.tblLoginData.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    func fetchLoginData()  {
        viewModel.getLoginData()
    }
    
    func prepareViewModelObserver()  {
        viewModel.BindDataChanges = { (finished,error) in
            if error == false {
                self.reloadTable()
            }
        }
    }
    
    func reloadTable()  {
        self.tblLoginData.reloadData()
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.responseData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.loginData = viewModel.responseData?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
