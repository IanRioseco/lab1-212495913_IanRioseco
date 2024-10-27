#lang racket
(provide (all-defined-out))

;; RF02
;Desc: Funcion para crear un jugador.
;Name: player.
;Dom: id(int) X name(string) X color(string) X wins(int) X losses(int) X draws(int) X remaining-pieces(int)
;Rec: player
(define (player id name color wins losses draws remaining-pieces)
  (list id name color wins losses draws remaining-pieces))

;; SELECTOR 
(define (get-player-id player)
  (car player))

(define (get-player-name player)
  (cadr player))

(define (get-player-color player)
  (caddr player))

(define (get-player-wins player)
  (cadddr player))

(define (get-player-losses player)
  (car(cddddr player)))

(define (get-player-draws player)
  (cadr (cddddr player)))

(define (get-player-remaining-pieces player)
  (caddr (cddddr player)))

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


