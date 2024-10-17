#lang racket
(provide (all-defined-out))
(require "TDApiece.rkt")
;; CONSTRUCTOR

; Descripción: funcion que crea un tablero de conecta4 vacio.
; Dom: no recibe parametros de entrada.
; Rec: board.
; Tipo recursión: No aplica.

(define (board)
  (define (columnas)
    (list 'vacio 'vacio 'vacio 'vacio 'vacio 'vacio 'vacio))
  (list (columnas)
        (columnas)
        (columnas)
        (columnas)
        (columnas)
        (columnas)))


;; OTROS

; TDABoard-otros-sepuedejugar?
; Descripción: Funcion que verifica si es posible realizar una jugada.
; Dom: tablero (board).
; Rec: boleano (#t si se puede jugar, #f si no).
; Tipo recursión: natural.
 (define (board-can-play? board) 
   (define (fila-tiene-espacio fila)
     (member 'vacio fila))
   
   (define (tablero-tiene-espacio filas)
     (cond
       ((null? filas) #f)
        ((fila-tiene-espacio (car filas)) #t)
         (else (tablero-tiene-espacio (cdr filas)))))
   
   (tablero-tiene-espacio board))


;TDAboard-check-vertical-win
; Descripción: Funcion que verifica si existe o no un ganador de manera vertical.
; Dom: tablero (board).
; Rec: int (1 si gana jugador 1, 2 si gana jugador 2 y 0 si no hay gandor vertical)
; Tipo recursión: natural.


;; MODIFICADOR

; DESCRIPCION: funcion para colocar una ficha en la posicion mas baja disponible en la columna seleccionada
; DOM: board(board) X column(int) X piece(piece)
; REC: board
; TIPO DE RECURSION: no aplica.

; Función para colocar una ficha en la columna más baja disponible de una columna
(define (board-set-play-piece board column piece)
  ; Función auxiliar para encontrar la fila más baja con una celda vacía
  (define (find-empty-row board column)
    (let ciclo ((remaining-rows (reverse board)) (index (- (length board) 1)))
      ; Recorremos las filas desde la más baja a la más alta, utilizando reverse para invertir el tablero
      ; y empezamos el índice desde la última fila
      (if (null? remaining-rows)
          #f  ; Si no quedan filas por revisar, significa que la columna está llena
          (if (equal? (list-ref (car remaining-rows) column) 'vacio)
              index  ; Si encontramos una celda vacía en la columna especificada, devolvemos el índice de la fila
              (ciclo (cdr remaining-rows) (- index 1))))))  ; Si no es vacía, revisamos la siguiente fila (subiendo)

  ; Función auxiliar para reemplazar la celda en una fila específica
  (define (replace-in-row row column piece)
    (map (lambda (i x)
           ; Recorremos la fila con map, si el índice i coincide con la columna especificada
           ; reemplazamos el valor de esa celda con la ficha piecee
           (if (= i column) piece x))  ; Si la posición corresponde a la columna, reemplaza con la ficha
         (range (length row)) row))  ; Recorremos la fila por índices usando range para iterar

  ; Buscar la fila más baja con espacio disponible en la columna
  (let ((row-index (find-empty-row board column)))
    ; Si no encontramos ninguna fila con espacio disponible, devolvemos el tablero tal como está
    (if (not row-index)  ; Si find-empty-row devuelve #f, no hay filas vacías
        board  ; Devolver el tablero original sin cambios
        ; Si encontramos una fila vacía, procedemos a reemplazar la celda vacía más baja
        (map (lambda (row idx)
               ; Recorremos cada fila junto con su índice
               (if (= idx row-index)  ; Si el índice de la fila coincide con la fila más baja disponible
                   (replace-in-row row column piece)  ; Reemplazamos esa fila colocando la ficha en la columna
                   row))  ; Si no coincide, dejamos la fila intacta
             board (range (length board))))))  ; Recorrer el tablero con índices de filas






