//
//  coffeeViewController.swift
//  brewedAwakeningsPrototype
//
//  Created by Rachel Rafik on 1/31/22.
//

import UIKit

class coffeeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet var images: [UIImageView]!
    
    @IBOutlet weak var tableView: UITableView!
    var items:[String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    @IBAction func whenTapGesturePressed(_ sender: UITapGestureRecognizer)
    {
        let selectedPoint = sender.location(in: view)
        print(selectedPoint)
        for img in images
        {
            if img.frame.contains(selectedPoint)
            {
                let newItem = "coffee"
                items.append(newItem)
                tableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }

}
