#lang racket
(provide (all-defined-out))

;; CONSTRUCTOR
;para ayudarme en la creacion de este TDA se lepregunto a chat-gpt sobre el uso de listas y la funcionalidad de car y cdr

;; RF02
;Desc: Funcion para crear un jugador.
;Name: player.
;Dom: id(int) X name(string) X color(string) X wins(int) X losses(int) X draws(int) X remaining-pieces(int)
;Rec: player
(define (player id name color wins losses draws remaining-pieces)
  (list id name color wins losses draws remaining-pieces))


;; SELECTOR
;Name:get-player-id
;Dom: player
;Rec: id del jugador
(define (get-player-id player)
  (car player));car para obtener el primer elemento

;Name:get-palyer-name
;Dom: player
;Rec: nombre del jugador
(define (get-player-name player)
  (cadr player));cadr para obtener el segundo elemento

;Name:get-palyer-color
;Dom: player
;Rec: color de las fichas del jugador
(define (get-player-color player)
  (caddr player));caddr para obtener el tercer elemento

;Name:get-player-wins
;Dom: player
;Rec: numero de victorias
(define (get-player-wins player)
  (cadddr player));cadddr para obtener el 4 elemento

;Name:get-player-losses
;Dom: player
;Rec: numero de derrotas
(define (get-player-losses player)
  (car(cddddr player)));con cddddr obtenemos la lista despues del 4 elemento y con car obtenemos el primer elemento de esa lista,
                       ;osea obtenemos el 5 elemento
;Name:get-player-draws
;Dom: player
;Rec: numero de empates
(define (get-player-draws player)
  (cadr (cddddr player)));con cddddr obtenemos la lista despues del 4 elemento y con cadr obtenemos el segundo elemento de esa lista,
                         ;osea obtenemos el 6 elemento
;Name:get-player-remaining-pieces
;Dom: player
;Rec: numero de piezas restantes
(define (get-player-remaining-pieces player)
  (caddr (cddddr player)));con cddddr obtenemos la lista despues del 4 elemento y con car obtenemos el tercer elemento de esa lista,
                          ;osea obtenemos el 7 elemento

;; MODIFICADOR
;funcion para actualizar las victorias del jugador
;desc: La función increment-player-wins toma un jugador (una lista que representa sus datos)
;y devuelve una nueva lista donde el número de victorias del jugador ha sido incrementado en 1
;DOM: player X incremento de victorias
;REC:player
(define increment-player-wins
  (lambda (player)
    (list (get-player-id player)             
          (get-player-name player)           
          (get-player-color player)          
          (+ 1 (get-player-wins player))     
          (get-player-losses player)         
          (get-player-draws player)          
          (get-player-remaining-pieces player))))

;Funcion Para Aumentar las derrotas
(define increment-player-losses
  (lambda (player)
    (list (get-player-id player)             
          (get-player-name player)           
          (get-player-color player)          
          (get-player-wins player)    
          (+ 1 (get-player-losses player))         
          (get-player-draws player)          
          (get-player-remaining-pieces player))))

;Funcion para aumentar los empates
(define increment-player-draw
  (lambda (player)
    (list (get-player-id player)             
          (get-player-name player)           
          (get-player-color player)          
          (get-player-wins player)   
          (get-player-losses player)         
          (+ 1 (get-player-draws player))          
          (get-player-remaining-pieces player))))


;funcion para disminuir el numero de fichas
(define decrease-player-pieces
  (lambda (player)
    (list (get-player-id player)             
          (get-player-name player)           
          (get-player-color player)          
          (get-player-wins player)    
          (get-player-losses player)       
          (get-player-draws player)          
          (- (get-player-remaining-pieces player) 1))))
