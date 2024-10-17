#lang racket
(provide (all-defined-out))
(require "TDApiece.rkt")
(require "TDAplayer.rkt")
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
 (define (board-can-play? tablero) 
   (define (fila-tiene-espacio fila)
     (member 'vacio fila))
   
   (define (tablero-tiene-espacio filas)
     (cond
       ((null? filas) #f)
        ((fila-tiene-espacio (car filas)) #t)
         (else (tablero-tiene-espacio (cdr filas)))))
   
   (tablero-tiene-espacio tablero))


;; MODIFICADOR

; DESCRIPCION: funcion para colocar una ficha en la posicion mas baja disponible en la columna seleccionada
; DOM: board(board) X column(int) X piece(piece)
; REC: board
; TIPO DE RECURSION: no aplica.

; Función para colocar una ficha en la columna más baja disponible de una columna
(define (board-set-play-piece tablero columna pieza)
  ; Función auxiliar para encontrar la fila más baja con una celda vacía
  (define (encontrar-fila-vacia tablero columna)
    (let ciclo ((filas-restantes (reverse tablero)) (index (- (length tablero) 1)))
      ; Recorremos las filas desde la más baja a la más alta, utilizando reverse para invertir el tablero
      ; y empezamos el índice desde la última fila
      (if (null? filas-restantes)
          #f  ; Si no quedan filas por revisar, significa que la columna está llena
          (if (equal? (list-ref (car filas-restantes) columna) 'vacio)
              index  ; Si encontramos una celda vacía en la columna especificada, devolvemos el índice de la fila
              (ciclo (cdr filas-restantes) (- index 1))))))  ; Si no es vacía, revisamos la siguiente fila (subiendo)

  ; Función auxiliar para reemplazar la celda en una fila específica
  (define (remplazar-en-la-fila fila columna pieza)
    (map (lambda (i x)
           ; Recorremos la fila con map, si el índice i coincide con la columna especificada
           ; reemplazamos el valor de esa celda con la ficha piecee
           (if (= i columna) pieza x))  ; Si la posición corresponde a la columna, reemplaza con la ficha
         (range (length fila)) fila))  ; Recorremos la fila por índices usando range para iterar

  ; Buscar la fila más baja con espacio disponible en la columna
  (let ((indice-fila (encontrar-fila-vacia tablero columna)))
    ; Si no encontramos ninguna fila con espacio disponible, devolvemos el tablero tal como está
    (if (not indice-fila)  ; Si find-empty-row devuelve #f, no hay filas vacías
        board  ; Devolver el tablero original sin cambios
        ; Si encontramos una fila vacía, procedemos a reemplazar la celda vacía más baja
        (map (lambda (fila idx)
               ; Recorremos cada fila junto con su índice
               (if (= idx indice-fila)  ; Si el índice de la fila coincide con la fila más baja disponible
                   (remplazar-en-la-fila fila columna pieza)  ; Reemplazamos esa fila colocando la ficha en la columna
                   fila))  ; Si no coincide, dejamos la fila intacta
             tablero (range (length tablero))))))  ; Recorrer el tablero con índices de filas



;TDAboard-check-vertical-win
; Descripción: Funcion que verifica si existe o no un ganador de manera vertical.
; Dom: tablero (board).
; Rec: int (1 si gana jugador 1, 2 si gana jugador 2 y 0 si no hay gandor vertical)
; Tipo recursión: natural

; Función para verificar victoria vertical en el tablero sin necesidad de pasar jugadores
(define (check-vertical-win board)
  ; Función auxiliar para obtener todas las columnas del tablero
  (define (get-column board col-index)
    (map (lambda (row) (list-ref row col-index)) board))  ; Extrae la columna correspondiente

  ; Función auxiliar para verificar si hay 4 fichas consecutivas en una lista
  (define (four-consecutive? lst)
    (cond
      ((< (length lst) 4) #f)  ; Si hay menos de 4 elementos, no puede haber 4 consecutivos
      ((and (not (equal? (car lst) 'empty))  ; Si la primera ficha no es vacía ('empty)
            (equal? (car lst) (cadr lst))   ; Si las siguientes 3 fichas son iguales
            (equal? (car lst) (caddr lst))
            (equal? (car lst) (cadddr lst))) 
       (car lst))  ; Retorna el color de la ficha ganadora (puede ser cualquier color)
      (else (four-consecutive? (cdr lst)))))  ; Verifica los siguientes elementos de la lista

  ; Recorre cada columna del tablero
  (define (check-columns board col-index)
    (if (>= col-index (length (car board)))  ; Si se recorrieron todas las columnas
        0  ; No hay ganador vertical
        (let ((column (get-column board col-index)))  ; Extrae la columna actual
          (let ((winner (four-consecutive? column)))  ; Verifica si hay 4 consecutivas en la columna
            (cond
              ((equal? winner 'red) 1)    ; Si el jugador 1 (rojo) gana, retorna 1
              ((equal? winner 'yellow) 2) ; Si el jugador 2 (amarillo) gana, retorna 2
              (else (check-columns board (+ col-index 1))))))))  ; Verifica la siguiente columna

  ; Llamada inicial para revisar todas las columnas
  (check-columns board 0))
          
                  
         


