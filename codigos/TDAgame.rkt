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
; Nombre: TDAgame-history
; Descripción: 
; Dom: 
; Rec: game
; Tipo recursión: No aplica.
#|
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
|#

(define (game-history game)
  (let ((board (list-ref game 2)))  ; Accedemos al tablero en el índice 2 del juego
    ;; Función que procesa las filas del tablero
    (define (process-rows rows fila-index result)
      (cond
        ;; Si no hay más filas, devolvemos el resultado acumulado
        ((null? rows) result)
        ;; Si hay más filas, procesamos las columnas dentro de cada fila
        (else
         (let ((current-row (car rows)))  ; Tomamos la fila actual
           ;; Función para procesar cada columna (celda) de la fila actual
           (define (process-cols cols col-index result)
             (cond
               ;; Si no hay más columnas, devolvemos el resultado
               ((null? cols) result)
               ;; Si hay una ficha en la columna actual, la agregamos al historial
               ((and (not (null? (car cols))) (not (eq? (car cols) 'vacio)))
                (process-cols (cdr cols) (+ col-index 1)
                              (append result (list (list col-index (car cols))))))
               ;; Si no hay ficha, simplemente avanzamos a la siguiente columna
               (else
                (process-cols (cdr cols) (+ col-index 1) result))))
           ;; Procesamos las columnas de la fila actual
           (process-rows (cdr rows) (+ fila-index 1) (process-cols current-row 0 result))))))
    
    ;; Llamada inicial con la primera fila y una lista vacía
    (process-rows board 1 '())))



;; RF13
; Nombre: TDAgame-is-draw
; Descripción: 
; Dom: 
; Rec: game
; Tipo recursión: No aplica.
(define (game-is-draw? game)
  (let ((board (list-ref game 2)))
    (cond
      ((equal? (board-check-vertical-win board) 0)
       (cond
         ((eq? (board-can-play? board) #f) #t)
         ((eq? (board-can-play? board) #t) #f)))   
      ((equal? (board-check-vertical-win board) 2) #f)
      ((equal? (board-check-vertical-win board) 1) #f)
      
      ((equal? (board-check-horizontal-win board) 0)
       (cond
         ((eq? (board-can-play? board) #f) #t)
         ((eq? (board-can-play? board) #t) #f)))   
      ((equal? (board-check-horizontal-win board) 2) #f)
      ((equal? (board-check-horizontal-win board) 1) #f))))
       

;; RF14
; Nombre: TDAboard player-update-stats
; Descripción: 
; Dom: 
; Rec: 
; Tipo recursión: No aplica.
(define player-update-stats
  (lambda (player result)
    (cond
      ((equal? result 'win) (increment-player-wins player))
       ((equal? result 'loss) (increment-player-losses player))
       ((equal? result 'draw) (increment-player-draw player)))))
       
;; RF15
; Nombre: TDAgame-get-current-player
; Descripción: obtener el jugador cuyo turno esta en curso. 
; Dom: game(game).
; Rec: player.
; Tipo recursión: No aplica.
(define (game-get-current-player game)
  (if (= (cadddr game) 1)
      (car game)
      (cadr game)))



;; RF16
; Nombre:
; Descripción: 
; Dom: 
; Rec: 
; Tipo recursión: No aplica.

;; RF17
; Nombre:
; Descripción: 
; Dom: 
; Rec: 
; Tipo recursión: No aplica.

;; RF18
; Nombre: TDAgame-player-set-move
; Descripción: funcion que realiza un movimiento
; Dom: game(game) X player(player) X column(int)
; Rec: game
; Tipo recursión: No aplica.
#|
(define (game-player-set-move game player column)
  (let* ((current-player (game-get-current-player game))
         (board (list-ref game 2))
         (hisotry (game-history game))
         (remaining-pieces (get-player-remaining-pieces player)))
    (if (not (equal? player current-player))
        (display "no es el turno del jugador 1.")
        (if (and (> column 6) (> column 0))
            (display "ingreso una columna incorrecta, debe ser de 0 a 6")
        (if (=(remaining-pieces 0)
              (display "El jugador a agotado todas sus fichas.")
              (if (equal? (board-can-play? board) #f)
                  ())))))))
|#              
              