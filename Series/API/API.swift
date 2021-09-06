import Alamofire //Es para hacer peticiones
import UIKit
import AlamofireObjectMapper //Para poder recibir objetos
import ObjectMapper
import Foundation



class Api{
    
    static let url:String = "https://api.themoviedb.org/3"
    static let apikey:String = "6ceae38bfc242dcb89b35eacb1604ec9"
    static func getPeliculas(callback:@escaping(_ responds:RespondsPelicula?)->Void){
        

        AF.request("\(url)/movie/now_playing?api_key=\(apikey)",
                   method: .get
        ).responseObject { (response: AFDataResponse<RespondsPelicula>) in
            if response.error != nil {
            print("No trae ningun pelicula")
            }
            else{
                var value = response.value
                print(response.value)
                print("Aqui estan tus pelicula")
                
                callback(value)
            }
        }
        
    }
    

    
    static func getPeliculasPopular(callback:@escaping(_ responds:RespondsPelicula?)->Void){
        
        AF.request("\(url)/movie/top_rated?api_key=\(apikey)",
                   method: .get
        ).responseObject { (response: AFDataResponse<RespondsPelicula>) in
            if response.error != nil {
            print("No trae ningun pelicula")
            }
            else{
                var value = response.value
                print(response.value)
                print("Aqui estan tus pelicula")
                
                callback(value)
            }
        }
    }
    
    
    static func getdetailspelicula(movieID:String, callbackInteractor:@escaping(_ detailspelicula:RespondsPelicula?)->Void){
        AF.request(movieID,
                   method: .get
        ).responseObject {(response: AFDataResponse<RespondsPelicula>)in
            if response.error != nil{
                print("No encuentro los detalles del pelicula")
            }
            else{
                var value = response.value
                print(response.value)
                print("Aqui estan los detalles")
                
                callbackInteractor(value)
            }
        }
     
    }
    
    
    //Funcion para obtener video
    static func getVideoPelicula(movieID:String, callbackInteractor:@escaping(_ detailsvideopelicula:RespondsPelicula?)->Void){
        AF.request("\(url)\(movieID)\"videos?\"\(apikey)",
                   method: .get
        ).responseObject {(response: AFDataResponse<RespondsPelicula>)in
            if response.error != nil{
                print("No encuentro los detalles del pelicula")
            }
            else{
                var value = response.value
                print(response.value)
                print("Aqui estan los detalles")
                
                callbackInteractor(value)
            }
        }
     
    }
    
}
