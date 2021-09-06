
import Kingfisher
import UIKit

class PeliculaTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgPelicula: UIImageView!
    @IBOutlet weak var lblNombrePelicula: UILabel!
    public var urlImgPelicula: String = ""
    {
        didSet
        {
            let url = URL(string: urlImgPelicula)
            imgPelicula.kf.setImage(with: url)
            
        }
        
    }
    
    public var nombrePelicula: String = ""{didSet{lblNombrePelicula.text = nombrePelicula}}

    
}
