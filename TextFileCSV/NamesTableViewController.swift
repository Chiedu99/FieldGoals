//
//  NamesTableViewController.swift
//  TextFileCSV
//
//  Created by Cheidu on 3/6/17.
//  Copyright © 2017 Cheidu. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController {
    var  data:[[String:String]] = []
    var  players = [Player]()
    var  columnTitles:[String] = []
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func reportData(sender: UIButton) {
    }
   

   

    
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        return cleanFile
    }
    
    func convertCSV(file:String){
        let rows = cleanRows(file: file).componentsSeparatedByString("\n")
        if rows.count > 0 {
            data = []
            columnTitles = getStringFieldsForRow(rows.first!,delimiter:",")
            for row in rows{
                let fields = getStringFieldsForRow(row,delimiter: ",")
                if fields.count != columnTitles.count {continue}
                var dataRow = [String:String]()
                for (index,field) in fields.enumerate(){
                    dataRow[columnTitles[index]] = field
                }
                data += [dataRow]
            }
        } else {
            print("No data in file")
        }
        }


    
    func getStringFieldsForRow(row:String, delimiter:String)-> [String]{
        return row.componentsSeparatedByString(delimiter)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        func printData(){
            convertCSV(file: textView.text)
            var tableString = ""
            var rowString = ""
            print("data: \(data)")
            for row in data{
                rowString = ""
                for fieldName in columnTitles{
                    guard let field = row[fieldName] else{
                        print("field not found: \(fieldName)")
                        continue
                    }
                    rowString += field + "\t"
                }
                tableString += rowString + "\n"
            }
            textView.text = tableString
        }
    }





        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
