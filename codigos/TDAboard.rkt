#lang racket
(provide (all-defined-out))
(require "TDApiece.rkt")
(require "colores.rkt")

;; RF04
; Nombre: TDAboard
; Descripción: funcion que crea un tablero de conecta4 vacio.
; Dom: no recibe parametros de entrada.
; Rec: board.
; Tipo recursión: No aplica.

(define columnas
  (list 'vacio 'vacio 'vacio 'vacio 'vacio 'vacio 'vacio))

(define board
  (list columnas
        columnas
        columnas
        columnas
        columnas
        columnas))  ; Tablero de 6 filas

;; RF05
; Nombre: TDABoard-otros-sepuedejugar?
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


;; RF06
; Nombre: TDAboard-set-play-piece
; DESCRIPCION: funcion para colocar una ficha en la posicion mas baja disponible en la columna seleccionada
; DOM: board(board) X column(int) X piece(piece)
; REC: board
; TIPO DE RECURSION: recusion natural
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


;; RF07
; Nombre: TDAboard-check-vertical-win
; Descripción: Funcion que verifica si existe o no un ganador de manera vertical.
; Dom: tablero (board).
; Rec: int (1 si gana jugador 1, 2 si gana jugador 2 y 0 si no hay ganador vertical)
; Tipo recursión: recusion natural

(define (board-check-vertical-win board);define la funcion principal que toma de argumento el tablero
  (define (check-column column);funcion interna que se encarga de verificar una columna especifica
    (define (check-consecutive lst color count);otra funcion interna que recibe una liksta color y un auxiliar
      (cond ;inicio de una condicion
        ((null? lst) #f) ;si la lista esta vacia devolvemos un falso
        ((equal? (car lst) 'vacio) (check-consecutive (cdr lst) 'vacio 0)) ;si el primer valor de la lista (car lst) es vacio reinicia el conteo y llama a
                                                                           ;check-consecutive con el resto de la lista (cdr lst) y un color vacio y contador en 0
        ((equal? (car lst) color);si la ficha actual es del mismo color qiue el anterior paso a la condicion if
         (if (= (+ count 1) 4);se incrementa el contador y se verifica si es que llego a 4
             color  ;si contador es igual a 4 se devuelve el color de la ficha ganadora
             (check-consecutive (cdr lst) color (+ count 1))));si contador distinto de 4 llama a check-consecutive con el resto de la lista y el mismo color y el cont en 1  
        (else (check-consecutive (cdr lst) (car lst) 1))));si la ficha actual es de otro color se llama a check-consecutive con el resto de la lista y el cont en 0
    (check-consecutive column 'vacio 0));inica la verificacion de la columna con color 'vacio y cont en 0
  (define (get-column filas);se define get-column que extraera una columna del tablero toma como argumento las filas
    (if (null? filas);si no hay mas filas 
        '();se retorna una lista vacia
        (cons (car (car filas)) (get-column (cdr filas)))));caso contrario toma el primer indice de la primera fila(este valor representa la columna) y llama a get-column con el resto de ellas
  (define (check-columns filas);se define una funcion para verificar todas las columnas del tablero
    (if (null? (car filas)) ;si la primera fila esta vacia indica que no hay mas columnas para verificar
        0 ;no hay ganador
        (let ((column (get-column filas)));caso contrario extrae la columna usando get-column para asignarla a column
          (let ((result (check-column column)));verifica la columna actual llamando a check-column y guarda el resultado en result
            (cond ;se inicia una condicion
              ((equal? result (car colores)) 1);si el resultado es igual a 'red devuelve 1 por lo que el p1 gano
              ((equal? result (cadr colores)) 2);si el resultado es igual a 'yellow devuelve 2 por lo que el p2 gano
              (else (check-columns (map cdr filas))))))));si no hay ganador llama a check-column pasandole las filas menos la primera usando pam cdr filas
  (check-columns board));se inicia la verificacion de las columnas


;; RF08
; Nombre: TDAboard-check-horizontal-win.
; Descripción: funcion que verifica si existe victoria horizontal.
; Dom: board(board).
; Rec: int (1 si gana jugador 1, 2 si gana jugador 2 y 0 si no hay ganador vertical)
; Tipo recursión: recursion natural.
(define (board-check-horizontal-win board);se define la funcion para verificar la victoria horizontal
  (define (check-row row);definicion de funcion interior para verificar una fila especifica
    (define (check-consecutive lst color count);definicon de una funcion interna que cuenta las fichac consecutivas en una fila tomando una lista, el color y un contador
      (cond ;se inicia una condicion
        ((null? lst) #f);si la lista esta vacia se retorna un falso lo que indica que no hay 4 posiciones seguidas 
        ((equal? (car lst) 'vacio) (check-consecutive (cdr lst) 'vacio 0));si la primera fila es 'vacio reinica el contador y llamaa check-consecutive con el resto de la lista
        ((equal? (car lst) color);si la ficha actual es del mismo color que la anterior ejecuta el if
         (if (= (+ count 1) 4);se le suma 1 al contador y si este es igual a 4
             color ;se entrega el color ganador
             (check-consecutive (cdr lst) color (+ count 1))));si cont no llego a 4, llama a check.comsecutive con el resto de la lista y el mismo color aumentando el cont
        (else (check-consecutive (cdr lst) (car lst) 1))));si la ficha actual es de otro color reiniciamos el contador
    (check-consecutive row 'vacio 0));se inicia la verificacion con la fila el color'vacio y el contador en 0
  (define (check-rows board);se define una funcion para verificar todas las filas
    (cond ;se inicia una condicion 
      ((null? board) 0);si no hay mas filas se retorna 0
      (else ;caso contrario
       (let ((result (check-row (car board))));se verifica la fila actual y se guarda el resultado
         (cond ;se inicia una condicion
           ((equal? result (car colores)) 1);si el resultado es igual a 'red gana p1
           ((equal? result (cadr colores)) 2);si el resultadoi es igual a 'yellow gana p1
           (else (check-rows (cdr board))))))));si no hay ganador se llama a check-rows con el resto de las filas
  (check-rows board));se inivia la verificacion de todas las filas


;; RF09
; Nombre: TDAboard-check-diagonal-win 
; Descripción: funcion que verifica si hay victoria diagonal
; Dom: board(board)
; Rec: int (1 si gana jugador 1, 2 si gana jugador 2 y 0 si no hay ganador vertical)
; Tipo recursión: recursion natural
(define (board-check-diagonal-win board)
  (define (check-diagonal-ascending row col color)
    (if (or (>= row (length board))
            (>= col (length (list-ref board 0)))
            (not (equal? (list-ref (list-ref board row) col) color)))
        0
        (+ 1 (check-diagonal-ascending (+ row 1) (+ col 1) color))))
  
  (define (check-diagonal-descending row col color)
    (if (or (< row 0)
            (>= col (length (list-ref board 0)))
            (not (equal? (list-ref (list-ref board row) col) color)))
        0
        (+ 1 (check-diagonal-descending (- row 1) (+ col 1) color))))
  
  (define (check-board row col)
    (cond
      ((>= row (length board)) 0)
      ((>= col (length (list-ref board 0))) (check-board (+ row 1) 0))
      (else
        (let ((color (list-ref (list-ref board row) col)))
          (if (equal? color 'vacio)
              (check-board row (+ col 1))
              (let ((asc (check-diagonal-ascending row col color))
                    (desc (check-diagonal-descending row col color)))
                (if (or (>= asc 4) (>= desc 4))               
                    (cond ((eq? color (car colores)) 2)
                          (else 1))
                    (check-board row (+ col 1)))))))))
  (check-board 0 0))  ; Empezar desde la primera fila


;; RF10
; Nombre: TDAboard-who-is-winner
; Descripción: funcion que verifica el estado actual del tablero y entrega un psible gandor
; Dom: board(board)
; Rec: int (1 si gana jugador 1, 2 si gana jugador 2 y 0 si no hay ganador vertical)
; Tipo recursión: No aplica.

(define (board-who-is-winner board)
  (let ((vertical (board-check-vertical-win board))
        (horizontal (board-check-horizontal-win board))
        (diagonal (board-check-diagonal-win board)))
    (if (not (eq? vertical 0))
        vertical
        (if (not (eq? horizontal 0))
            horizontal
            (if (not (eq? diagonal 0))
                diagonal
                0)))))
   
        
