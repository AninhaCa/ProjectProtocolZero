//
//  ViewController.swift
//  ProjectProtocolZero
//
//  Created by Ana Paula Silva de Sousa on 28/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var arrayPizza: Pizza?
    
    let request = RequestPizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        myRequest()
    }

    func setupTableView() {
        
    }
    
    func myRequest() {
        request.delegate = self
        request.requestPizza { pizza in
        }
    }
}

extension ViewController: RequestDelegate {
    func finishRequest(arrayPizza: Pizza?) {
        self.arrayPizza = arrayPizza
        self.tableView.reloadData()
    }
}
