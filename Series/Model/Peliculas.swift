
import Alamofire //Es para hacer peticiones
import UIKit
import AlamofireObjectMapper //Para poder recibir objetos
import ObjectMapper
import Foundation



class RespondsPelicula:Mappable{
    
    var description:String = ""
    var name:String = ""
    var items:[ResultsPelicula] = []
    
    required init?(map: Map) {

        
    }
    
    func mapping(map: Map) {
        
        description <- map["description"]
        name <- map["name"]
        items <- map["results"]
    }
    
    

        
}

class ResultsPelicula:Mappable{
        
    var originalTitle:String = ""
    var overview:String = ""
    var voteAverage:Double = 0
    var voteCount:Double = 0
    var posterPath:String = ""
    
    
    required init?(map: Map) {
        
    }
    
    func mapping (map: Map){
        
 
        originalTitle <- map ["original_title"]
        overview <- map ["overview"]
        voteAverage <- map ["vote_average"]
        voteCount <- map["vote_count"]
        posterPath <- map["poster_path"]
    }
    func getFullImageUrl ()->String{
        return "https://image.tmdb.org/t/p/w500/\(posterPath)"
    }
}

class ResultsVideoPelicula:Mappable{
    
    var clave:String = ""
    var name:String = ""
    var site:String = ""
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        clave <- map["id"]
        name <- map["name"]
        site <- map["site"]
    }

}
