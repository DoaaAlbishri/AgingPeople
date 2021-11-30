//
//  ViewController.swift
//  Aging People
//
//  Created by Doaa Albishri on 29/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
var people = ["George" , "Betty" , "Fran" , "Joe", "Helda" , "Winifred" , "Zed" , "Sara" ,"Jeffy" , "Abraham" , "Anna" ,"Melinda"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self  // add this line
    }


}

extension ViewController: UITableViewDataSource , UITableViewDelegate{
    
    // MAKE SURE THESE ARE WITHIN UITableViewDataSource EXTENSION!
    // How many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return people.count
    }

    // How should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        let cell = tableView.dequeueReusableCell(withIdentifier:"MyCell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row]
        cell.detailTextLabel?.text = "\(Int.random(in: 5...95)) Years Old"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        people.remove(at: indexPath.row)
        tableView.reloadData()
    }


}
