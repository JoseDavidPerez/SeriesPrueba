//
//  DetallesPeliculaViewController.swift
//  Series
//
//  Created by osx on 05/09/21.
//

import UIKit

class DetallesPeliculaViewController: UIViewController {

    @IBOutlet weak var imgPelicula: UIImageView!
    @IBOutlet weak var lblvotacion: UILabel!
    @IBOutlet weak var lblvotos: UILabel!
    @IBOutlet weak var lblTituloPelicula: UILabel!
    @IBOutlet weak var lblsinopsis: UILabel!
    
    var pelicula:ResultsPelicula?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        
        lblvotacion.text = "\(pelicula!.voteAverage)"
        lblvotos.text = "\(pelicula!.voteCount)"
        lblsinopsis.text = pelicula?.overview
        lblTituloPelicula.text = pelicula?.originalTitle
        let url = URL(string:pelicula?.getFullImageUrl() ?? "")
        imgPelicula.kf.setImage(with: url)
        
    }

}
