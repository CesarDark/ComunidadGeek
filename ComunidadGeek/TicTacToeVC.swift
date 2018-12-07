//
//  TicTacToeVC.swift
//  ComunidadGeek
//
//  Created by CesarDark on 19/11/18.
//  Copyright © 2018 CesarDark. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController {

    //Variables
    var jugadorActivo = 1
    var estadoJuego = [0, 0, 0, 0, 0, 0, 0, 0, 0] // Las 9 casillas del tablero
    var juegoActivo = true
    let combinacionesGanador = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] //Posibles combinaciones de ganar
    
    @IBOutlet weak var labelTic: UILabel!
    //@IBOutlet weak var actionTic: UIButton!
    
    @IBAction func actionTicTacToe(_ sender: AnyObject) {
        
        if (estadoJuego[sender.tag-1] == 0 && juegoActivo == true){
            
            estadoJuego[sender.tag-1] = jugadorActivo
            
            if (jugadorActivo == 1){
                sender.setImage(UIImage(named: "logo_spider.png"), for: UIControl.State())
                jugadorActivo = 2
            }
            else {
                sender.setImage(UIImage(named: "X-MEN-Logo.png"), for: UIControl.State())
                jugadorActivo = 1
            }
        }
        
        //Combinaciones del ganador
        for combinacion in combinacionesGanador{
            if (estadoJuego[combinacion[0]] != 0 && estadoJuego[combinacion[0]] == estadoJuego[combinacion[1]] && estadoJuego[combinacion[1]] == estadoJuego[combinacion[2]]){
                
                juegoActivo = false
                
                if estadoJuego[combinacion[0]] == 1 {
                    //print("GANADOR")
                    labelTic.text = "¡GANADOR!"
                }
                else {
                    //print("PERDISTE :\"u")
                    labelTic.text = "PERDISTE :\"u"
                }
                
                buttonPlay.isHidden =  false
                labelTic.isHidden = false
            }
        }
        
        // Si es empate
        juegoActivo = false
        
        for i in estadoJuego {
            if i == 0 {
                juegoActivo = true
                break
            }
        }
        
        if juegoActivo == false {
            labelTic.text = "EMPATE"
            labelTic.isHidden = false
            buttonPlay.isHidden = false
        }
    }
    
    //Volver a jugar
    @IBOutlet weak var buttonPlay: UIButton!
    @IBAction func buttonAgain(_ sender: UIButton) {
        
        estadoJuego = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        juegoActivo =  true
        jugadorActivo = 1
        
        buttonPlay.isHidden = true
        labelTic.isHidden = true
        
        for i in 1...9 {
            let boton = view.viewWithTag(i) as! UIButton
            boton.setImage(nil, for: UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTic.layer.masksToBounds = true
        labelTic.layer.cornerRadius = 10
        
        buttonPlay.layer.cornerRadius = 10
    }

}
