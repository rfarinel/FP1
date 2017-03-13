## My Library: db

My name: Robert Farinelli


I tested the db library. I created a sqlite database to test the library using made up character data from a video game.
I then: created a connection,
querried all the data and then converted it from a list of vectors into a list of lists, made a querry to insert a new record, 
created a second dataset to
show the differnces, craeted 3 higher order (filter/foldr) to manipulate the data. One of these was getting the total characters in the set.
The next was getting the average level from the dataset. Finally was filtering all the characters whose lv was under 30. I then checked if the database connection was closed and finaly closed the db conection.



* highlights of code that you wrote

```
;;open the database connection
(define db-file "C:/Users/Bobby/Downloads/databases/test.db")

(define dbconn (sqlite3-connect #:database db-file))

;;extract the data to a list of lists
(define dataset (ToList (query-rows dbconn "SELECT * FROM char_data")))

;;create and run a querry
(define q "INSERT INTO char_data(Name,LV,HP,MP,MOV,ATK,MAG,DEF,RES,SPD,LCK)  
VALUES ('foo',0,0,0,0,0,0,0,0,0,0);")

(query-exec dbconn q)

;;close database
(disconnect dbconn)
```


* output from your code demonstrating what it produced
```
> dbInfo
(object:sqlite3-dbsystem% ...)
> dataset
'(("Marth" 34 282 62 5 123 82 119 119 63 62)
  ("Luna" 36 256 72 4 104 120 107 141 66 96)
  ("Eizen" 32 331 49 6 121 64 114 92 88 69)
  ("Gaston" 9 91 19 3 42 12 44 30 21 14)
  ("Luke" 18 117 26 4 59 41 56 51 34 42)
  ("Ayesha" 35 235 74 5 113 117 96 129 79 73)
  ("Yu" 16 110 29 6 49 43 54 45 48 38)
  ("Sakuya" 34 279 75 5 127 131 119 132 67 68)
  ("Keith" 28 209 47 5 85 59 91 82 43 43)
  ("Kaine" 32 237 64 4 97 115 99 128 54 68)
  ("Alice" 28 193 36 5 99 70 76 82 58 59)
  ("Ricther" 29 249 46 4 100 73 101 89 53 52)
  ("Hilda" 34 310 86 4 119 149 111 144 74 76)
  ("Lucia" 37 302 86 4 110 160 106 142 66 89))
> connectionOpen?
#t
> dataset2
'(("Marth" 34 282 62 5 123 82 119 119 63 62)
  ("Luna" 36 256 72 4 104 120 107 141 66 96)
  ("Eizen" 32 331 49 6 121 64 114 92 88 69)
  ("Gaston" 9 91 19 3 42 12 44 30 21 14)
  ("Luke" 18 117 26 4 59 41 56 51 34 42)
  ("Ayesha" 35 235 74 5 113 117 96 129 79 73)
  ("Yu" 16 110 29 6 49 43 54 45 48 38)
  ("Sakuya" 34 279 75 5 127 131 119 132 67 68)
  ("Keith" 28 209 47 5 85 59 91 82 43 43)
  ("Kaine" 32 237 64 4 97 115 99 128 54 68)
  ("Alice" 28 193 36 5 99 70 76 82 58 59)
  ("Ricther" 29 249 46 4 100 73 101 89 53 52)
  ("Hilda" 34 310 86 4 119 149 111 144 74 76)
  ("Lucia" 37 302 86 4 110 160 106 142 66 89)
  ("foo" 0 0 0 0 0 0 0 0 0 0))
> totalCharacters
14
> (GetAgvLv dataset)
28 5/7
> HighLvCharacters
'(("Marth" 34 282 62 5 123 82 119 119 63 62)
  ("Luna" 36 256 72 4 104 120 107 141 66 96)
  ("Eizen" 32 331 49 6 121 64 114 92 88 69)
  ("Ayesha" 35 235 74 5 113 117 96 129 79 73)
  ("Sakuya" 34 279 75 5 127 131 119 132 67 68)
  ("Kaine" 32 237 64 4 97 115 99 128 54 68)
  ("Hilda" 34 310 86 4 119 149 111 144 74 76)
  ("Lucia" 37 302 86 4 110 160 106 142 66 89))
```


* at least one diagram or figure showing your work

!

[Screenshot](FP1/diagram.png)