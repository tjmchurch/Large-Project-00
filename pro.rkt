#lang racket
(require 2htdp/batch-io)
;T if word is contained in lst
(define (containedIn? word lst)
  (cond
    [(empty? word)#t]
    [(empty? lst) #f]
    [(> (count (lambda (x) (equal? x (first word))) word) (count (lambda (x) (equal? x (first word))) lst)) #f ]
    [else (containedIn? (rest word) lst)]
   )

  )
;;;;;;;;;;;;
;converts a list to a list all containing lower case letters
;;;;;;;;;;;;
(define (lst->lower lst)
  (cond
   [(empty? lst)'()]
   [(char-lower-case? (first lst)) (cons (first lst) (lst->lower (rest lst)))]
   [else (cons (char-downcase (first lst)) (lst->lower (rest lst)))]

    )
  )
;;;;;;;;;;;;
;converts a string to a list all containing lower case letters
;;;;;;;;;;;;
(define (str->LowerList lst)
  (cond
    [(empty? lst) '()]
    [else (append (lst->lower (string->list(first lst))) (str->LowerList (rest lst)))]
    )

  )
;;;;;;;;;;;;;
;helper function for findWords
;standardizes the input list to one string
;;;;;;;;;;;;;
; CONTRACT: find-words : letters -> String
; PURPOSE: Returns a string of comma delimited dictionary words 7
; letters long and in alphabetical order that can be composed of
; characters in letters. (anagrams of letters) There is no trailing
; comma after the last word in the returned string.
; Each letter in letters may only be used once per match, e.g.
; (find-words '("zymomin" "am")) could return "mammoni, zymomin"
; because "mammoni" is composed of letters in letters including the
; three 'm' characters in letters, and "zymomin" is similarly composed of
; letters in letters. However, "mammomi" could not be
; returned because "mammomi" requires four 'm' characters and
; only three are available in letters.
; CODE:
(define (find-words letters)
   (printFormat (findWords (str->LowerList letters)))
)
;;;;;;;;;;;;;
;reads in a list of strings from words.txt
;filters all word that do not contain the letters from lst
;filters out all non 7 letter words
;;;;;;;;;;;;;
(define (findWords lst)
  (filter(lambda (x) (and(eq? (string-length x) 7) (containedIn? (lst->lower(string->list x)) lst))) (read-lines "words.txt") )
 )
;;;;;;;;;;;;;
;takes in a list of strings, converts them to a csv string and converts all strings to lower case
;;;;;;;;;;;;;
(define (printFormat lst)
  (cond
    [(empty? lst) lst]
    [(empty? (rest lst)) (first lst)]
    [else (string-append (string-downcase (first lst)) ", " (printFormat (rest lst)) )]
   )
)

;(displayln  '("asds" "as"))
;single item
(time(begin(displayln (find-words '("zxcvbnm")))))
;empty string
(time(begin(displayln (find-words '("")))))
;empty list
(time(begin(displayln (find-words '()))))
;multiple items
(time(begin(displayln (find-words '("zxcvbnm" "aeiuo")))))



