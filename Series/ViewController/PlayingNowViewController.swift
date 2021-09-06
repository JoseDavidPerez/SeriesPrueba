

import UIKit

class PlayingNowViewController: UIViewController {

    @IBOutlet weak var tblPeliculas: UITableView!
    var item:RespondsPelicula? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setupUI (){
        
        tblPeliculas.delegate = self
        tblPeliculas.dataSource = self
        tblPeliculas.register(UINib(nibName: "PeliculaTableViewCell", bundle:  nil), forCellReuseIdentifier: "PeliculaTableViewCell")
        
    }
    
    func setupData(){
        Api.getPeliculas { result in
            self.item = result
            self.tblPeliculas.reloadData()
        }
        
    }

}
    

    extension PlayingNowViewController: UITableViewDelegate, UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DetallesPeliculaViewController") as! DetallesPeliculaViewController
            vc.pelicula = item?.items[indexPath.row]
            self.navigationController!.pushViewController(vc , animated: true)
            
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if item != nil {
                return item!.items.count
            }
            return 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PeliculaTableViewCell" ) as! PeliculaTableViewCell
            cell.nombrePelicula = item!.items[indexPath.row].originalTitle
            cell.urlImgPelicula = item!.items[indexPath.row].getFullImageUrl()
            return cell
            
        }
    }
