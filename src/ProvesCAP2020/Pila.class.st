"
Please c
"
Class {
	#name : #Pila,
	#superclass : #Object,
	#category : #ProvesCAP2020
}

{ #category : #'as yet unclassified' }
Pila class >> creaPila [
	| pila index |
	
	"Les operacions de la pila compartiran aquestes variables locals"
	pila := OrderedCollection new.
	index := 0.
	
	"Retornem un Array amb sis closures, cada una d'elles corresponent a una
	operació sobre piles"
	^ { 
	[ pila := OrderedCollection new. index := 0. pila ] .       "crea la pila"
	[ index > 0 ifTrue: [ index := index - 1. pila removeLast ] "pop"
					ifFalse: [ Pila error: 'Pila Buida' ] ] . 
	[ index > 0 ifTrue: [ pila last ]                           "top"
					ifFalse: [ Pila error: 'Pila Buida' ] ] . 
	[ :elem | index := index + 1. pila add: elem. ] .           "push"
	[ index ] .                                                 "nombre d'elements de la pila"
	[ index = 0 ]                                               "pila buida?"
	 }
]
