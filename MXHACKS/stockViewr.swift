//
//  stockViewr.swift
//  viewer
//
//  Created by Rodolfo Castillo on 11/04/15.
//  Copyright (c) 2015 Rodolfo Castillo. All rights reserved.
//

import Foundation

class stockViewr {

    var currentValue: Float?
    var lastValue: Float?
    var difValue: Float?
    var stockHist = [Float]()
    var randomNumber : Float?
    
    init(){
        self.currentValue = 0
        self.lastValue = 0
        self.getDif()
    }
    
    //este getter solo llama al metodo del http para obtener los cambios en el stock para graficarlo, para añadir este metodo solo hay que borrar las cosas relacionadas a random number y descomentar las lineas que tienen que ver con el httpget()
    func getCValue()->Float{
        self.lastValue = self.currentValue!
        //httpget()
        randomNumber = (Float(rand()%20))/0.98237 + 1000 //borrar
        currentValue = randomNumber //borrar
        self.stockHist.append(self.currentValue!)
        return randomNumber! //borrar
        //return currentValue!
    }
    
    //Esta funcion es la que nos permite conocer el porcentaje de subida o bajada de el stock, dependiendo de el ultimo valor y lo regresa
    func getDif()->Float{
        var prValue: Float
        getCValue()
        if(self.currentValue > self.lastValue){
            self.difValue = self.currentValue! - self.lastValue!
            prValue = self.difValue!/self.lastValue!
            return prValue*100
        } else if(self.lastValue > self.currentValue){
            self.difValue = self.lastValue! - self.currentValue!
            prValue = self.difValue!/self.lastValue!
            prValue = prValue*(-1)
            return prValue*100
        } else {
            return 0
        }
    }
    
    
    
    //Esta es la funcion que realiza el vervo get para la api, solo hay que remplazar la key del diccionario y el url
    func httpget()->Float{
        let urlAsString = "https://morning-brook-3318.herokuapp.com/last/last.json"
        let url = NSURL(string: urlAsString)!
        let urlSession = NSURLSession.sharedSession()
        let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            if (error != nil) {
                println(error.localizedDescription)
            }
            var err: NSError?
            
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
            if (err != nil) {
                println("JSON Error \(err!.localizedDescription)")
            }
            
            // 4
            
            let jsonVal: String! = jsonResult["latitude"] as NSString
            
            
            dispatch_async(dispatch_get_main_queue(), {
                self.currentValue = (jsonVal as NSString).floatValue
                
            })
        })
        // 5
        jsonQuery.resume()
        return currentValue!
    }
    
    
    
    
    

}