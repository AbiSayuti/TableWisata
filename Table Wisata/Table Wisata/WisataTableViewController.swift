//
//  WisataTableViewController.swift
//  Table Wisata
//
//  Created by Abi Sayuti on 10/17/17.
//  Copyright © 2017 AbiSayuti. All rights reserved.
//

import UIKit

class WisataTableViewController: UITableViewController {
    
    //deklarasi namaSelected dan gambarSelected untuk mengirimkan data
    
    var namaSelected:String?
    var gambarSelected:String?
    
    //deklarasi nama pantai
    
    var NamaPantai = ["kemala-beach", "Pantai-Lamaru", "labuan-cermin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return NamaPantai.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWisata", for: indexPath)
        
        // Configure the cell...
        
        //configure the cell
        cell.textLabel?.text = NamaPantai[indexPath.row]
        
        // show the image
        let imageName  = UIImage (named: NamaPantai[indexPath.row])
        cell.imageView?.image = imageName
        
        return cell
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //mengecek data yang terkirim
        print("Row \(indexPath.row)selected")
        //memasukkan data ke variable namaSelected dan imageSelected ke masing2 variablenya
        
        namaSelected = self.NamaPantai[indexPath.row]
        gambarSelected = self.NamaPantai[indexPath.row]
        //memanggil segue passDataDetail
        performSegue(withIdentifier: "PassdataDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //mengecek apakah seguenya ada atau tidak
        if segue.identifier == "PassdataDetail" {
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let kirimData = segue.destination as! DetailViewController
            //mengirimkan data ke masing2 variabel
            //mengirimkan data gambar wisata
            kirimData.passnamawisata = namaSelected
            //mengirimkan data gambar wisata
            kirimData.passGambarWisata = gambarSelected
        
        
    }
    
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let more = UITableViewRowAction(style: .normal, title: "More")
        { action, index in
            //self,isEditing = false
            print("more button tapped")
        }
        more.backgroundColor = UIColor.lightGray
        
        let detail = UITableViewRowAction(style: .normal, title: "Detail")
        { action, index in
            //self,isEditing = false
            print("Detail button tapped")
            //untuk pindah ke layout
            let vc =
                self.storyboard?.instantiateViewController(withIdentifier: "detailWisata") as! MapKitViewController
            self.present(vc, animated: true, completion: nil)
        }
        //memberikan warna pada menu detail
        detail.backgroundColor = UIColor.orange
        
        let showmap = UITableViewRowAction(style: .normal, title: "Show map")
        { action, index in
            //self,isEditing = false
            print("Show map button tapped")
            
            //untuk pindah ke layout mapkit
            let vc =
            self.storyboard?.instantiateViewController(withIdentifier: "detailMap") as! MapKitViewController
            self.present(vc, animated: true, completion: nil)
        }
        showmap.backgroundColor = UIColor.blue
        
        return [showmap, detail, more]
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    //    // untuk menampilkan menu swift
    //    // Override to support editing the table view.
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //
    //            //hapus item dari array
    //            NamaPantai.remove(at: indexPath.row)
    //            //hapus data dari table view
    //            tableView.deleteRows(at: [indexPath], with: .fade)
    //
    //        } else if editingStyle == .insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //        }
    //    }
    
    // costum menu swipe
    
    //        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    //
    //            let more = UITableViewRowAction(style: .normal, title: "More")
    //            { action, index in
    //                //self,isEditing = false
    //                print("more button tapped")
    //            }
    //            more.backgroundColor = UIColor.lightGray
    //
    //            let detail = UITableViewRowAction(style: .normal, title: "Detail")
    //            { action, index in
    //                //self,isEditing = false
    //                print("Detail button tapped")
    //            }
    //            //memberikan warna pada menu detail
    //            detail.backgroundColor = UIColor.orange
    //
    //            let showmap = UITableViewRowAction(style: .normal, title: "Show map")
    //            { action, index in
    //                //self,isEditing = false
    //                print("Show map button tapped")
    //            }
    //            showmap.backgroundColor = UIColor.blue
    //
    //            return [showmap, detail, more]
    //        }
    
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
