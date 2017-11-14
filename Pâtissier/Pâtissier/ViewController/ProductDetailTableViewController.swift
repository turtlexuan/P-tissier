//
//  ProductDetailTableViewController.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/20.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: BaseTableViewController {
    
    enum Component {
        case Detail
        case Comment
    }
    
    let components: [Component] = [.Detail, .Comment]
    
    var productID = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "CommentTableViewCell")
        self.tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductTableViewCell")
        
        self.tableView.estimatedRowHeight = 100
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.components.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch self.components[indexPath.section] {
            
        case .Detail:
            
            return 145
            
        case .Comment:
            
            return UITableViewAutomaticDimension
            
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.components[indexPath.section] {
            
        case .Detail:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
            
            return cell
            
        case .Comment:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
            
            return cell
            
        }

    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch self.components[section] {
            
        case .Detail:
            return 0
        case .Comment:
            return 20
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = TableViewHeaderView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 20))

        header.titleLabel.text = "Comment"
        
        return header
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
