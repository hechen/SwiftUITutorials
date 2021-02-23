//
//  ViewController.swift
//  TableViewDemo
//
//  Created by chen on 2021/1/29.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(HostingTableViewCell<Text>.self, forCellReuseIdentifier: "cell")
        return tv
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate(
            [
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ]
        )
        
        tableView.reloadData()
    }
    
    
    var objects: [String] = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7"
    ]
}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let text = objects[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HostingTableViewCell<Text>
        cell.host(Text(text), parent: self)
        
        return cell
    }
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
