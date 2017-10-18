//
//  DetailViewController.swift
//  Table Wisata
//
//  Created by Abi Sayuti on 10/17/17.
//  Copyright © 2017 AbiSayuti. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var NamaWisata: UILabel!
    @IBOutlet weak var imgGambar: UIImageView!
    
    //deklarasi variable untuk menampung data yang dikirim
    var passnamawisata:String?
    var passGambarWisata:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//menampilkan data yang sudah dikirim
       NamaWisata.text = passnamawisata
        //menampilkan gambar
        imgGambar.image = UIImage(named: passGambarWisata!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
