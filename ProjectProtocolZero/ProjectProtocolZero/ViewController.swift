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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MyCustomCellXIB", bundle: nil), forCellReuseIdentifier: "cellXIB")
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPizza?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellXIB", for: indexPath) as? MyCustomCellXIB {
            cell.setupXIB(pizza: arrayPizza?[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let priceView = self.storyboard?.instantiateViewController(identifier: "price") as? PriceViewController {
            priceView.pricePizza = arrayPizza?[indexPath.row]
            self.present(priceView, animated: true)
        }
    }
}
