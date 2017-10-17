//
//  MapKitViewController.swift
//  Table Wisata
//
//  Created by Abi Sayuti on 10/17/17.
//  Copyright © 2017 AbiSayuti. All rights reserved.
//

import UIKit

//import new library
import MapKit

class MapKitViewController: UIViewController {

    @IBOutlet weak var petaWisata: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //deklarasi lotitude longitude
        //https://www.latlong.net
        
        let lokasiWisata = CLLocationCoordinate2D(latitude: 1.256631, longitude: 1.256631)
        let span = MKCoordinateSpanMake(0.05, 0.05 )
        let region = MKCoordinateRegion(center: lokasiWisata, span: span)
        petaWisata.setRegion(region, animated: true)
        
        //annonation berfungsi untuk menjadi marker pada maps
        //ketika maps di pencet akan keluar tittle dan subtitle
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = lokasiWisata
        annotation.title = "Labuan Cermin"
        annotation.subtitle = "Kaltim"
        petaWisata.addAnnotation(annotation)
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
