#lang racket
(provide (all-defined-out))
(require "TDAplayer.rkt")
(require "TDAboard.rkt")


;; RF11
; Descripción: Funcion que permite crear una nueva partida.
; Dom: player1(player) X player2(player) X board(board)X current-turn(int)
; Rec: game
; Tipo recursión: No aplica.
(define (game player1 player2 board current-turn)
  (list player1 player2 board current-turn))

; Selectores del juego
(define (game-player1 game) (car game))
(define (game-player2 game) (cadr game))
(define (game-board game) (caddr game))
(define (game-current-turn game) (cadddr game))

;; RF12
; Nombre:TDAgame-history
; Descripción: 
; Dom: 
; Rec: game
; Tipo recursión: No aplica.

(define (game-history game)
  (let ((board (list-ref game 2)))  ; Accedemos al tablero en el índice 2 del juego
    (define (create-history board column result)
      (cond
        ;; Si el tablero está vacío, devolvemos el resultado acumulado.
        ((null? board) result)
        ;; Si la columna está vacía, pasamos a la siguiente columna.
        ((null? (car board))
         (create-history (cdr board) (+ column 1) result))
        ;; Recorremos las filas de cada columna para buscar colores.
        (else
         (let ((current-column (car board)))  ; Obtenemos la columna actual
           (define (process-rows rows result)
             (cond
               ;; Si ya no hay más filas, devolvemos el resultado.
               ((null? rows) result)
               ;; Si la fila contiene una pieza (color), la agregamos al historial.
               ((and (not (null? (car rows))) (not (eq? (car rows) 'vacio)))
                (process-rows (cdr rows) (append result (list (cons column (car rows))))))
               ;; Si la fila está vacía, simplemente pasamos a la siguiente.
               (else
                (process-rows (cdr rows) result))))
           ;; Procesamos las filas de la columna actual y pasamos a la siguiente columna.
           (create-history (cdr board) (+ column 1) (process-rows current-column result))))))
    ;; Llamamos a la función recursiva con la primera columna y una lista vacía para el historial.
    (create-history board 1 '())))





;; RF13
; Descripción: 
; Dom: 
; Rec: game
; Tipo recursión: No aplica.
(define (game-is-draw game)
  (let ((board (list-ref game 2)))
    (cond
      ((equal? (check-vertical-win board) 0)
       (cond
         ((eq? (board-can-play? board) #f) #t)
         ((eq? (board-can-play? board) #t) #f)))   
      ((equal? (check-vertical-win board) 2) #f)
      ((equal? (check-vertical-win board) 1) #f))))

         

;; RF14
;;TDAboard player-update-stats
(define player-update-stats
  (lambda (player result)
    (cond
      ((equal? result 'win) (increment-player-wins player))
       ((equal? result 'loss) (increment-player-losses player))
       ((equal? result 'draw) (increment-player-draw player)))))
       
;; RF15
; Descripción: 
; Dom: 
; Rec: game
; Tipo recursión: No aplica.

;; RF16
; Descripción: 
; Dom: 
; Rec: game
; Tipo recursión: No aplica.

;; RF17
; Descripción: 
; Dom: 
; Rec: game
; Tipo recursión: No aplica.

;; RF18
; Descripción: 
; Dom: 
; Rec: game
; Tipo recursión: No aplica.