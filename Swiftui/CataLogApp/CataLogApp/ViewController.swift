//
//  ViewController.swift
//  CataLogApp
//
//  Created by Mukund vaghasiya  on 02/06/23.
//

import UIKit
// https://flutterandiosproject.000webhostapp.com/catalog.php

struct Modle:Codable{
    
    var productname:String?
    var price:String?
    var image:String?
}


class ViewController: UIViewController {
    var Data:[Modle] = []
    @IBOutlet weak var Tables: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Prasedata()
        Tables.delegate = self
        Tables.dataSource = self
    }

    func Prasedata(){
        let url = URL(string: "https://flutterandiosproject.000webhostapp.com/catalog.php")
                URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data ,error == nil else{ return }
            do{
                self.Data = try JSONDecoder().decode([Modle].self, from: data)
                print(self.Data)
                DispatchQueue.main.async {
                    self.Tables.reloadData()
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
        
        
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tables.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.ProductName.text = Data[indexPath.row].productname ?? "nil"
        cell.Price.text = Data[indexPath.row].price ?? "nil"
        cell.WebViewwidget.load(URLRequest(url: URL(string: Data[indexPath.row].image!)!))
        return cell
    }
    
    
}
