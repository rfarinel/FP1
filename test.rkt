#lang racket
(require db)

(define db-file "C:/Users/Bobby/Downloads/databases/test.db")

(define dbconn (sqlite3-connect #:database db-file))

(define dbInfo (connection-dbsystem dbconn))

(define (ToList thing)
  (foldr (lambda (x y) (cons (vector->list x) y)) '() thing))

(define dataset (ToList (query-rows dbconn "SELECT * FROM char_data")))

(define q "INSERT INTO char_data(Name,LV,HP,MP,MOV,ATK,MAG,DEF,RES,SPD,LCK)  
VALUES ('foo',0,0,0,0,0,0,0,0,0,0);")

(query-exec dbconn q)

(define connectionOpen? (connected? dbconn))

(define dataset2 (ToList (query-rows dbconn "SELECT * FROM char_data")))

;;using higher-order functions;;;;;;;;;;;;;;;;
(define totalCharacters (foldr (lambda (x y) (+ 1 y)) 0 dataset))

(define (GetAgvLv charList)
  (foldr (lambda(x y) (+ (/ (car (cdr x)) totalCharacters) y)) 0 charList))

(define HighLvCharacters(filter (lambda(x) (> (car (cdr x)) 30)) dataset))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(disconnect dbconn)

