"
Please c
"
Class {
	#name : #Pila,
	#superclass : #Object,
	#category : #ProvesCAP2020
}

{ #category : #'as yet unclassified' }
Pila class >> provaPila [
	| pila index |
	pila := OrderedCollection new.
	index := 0.
	^ { 
	[ pila := OrderedCollection new. index := 0. pila ] .
	[ index > 0 ifTrue: [ index := index - 1. pila removeLast ] 
					ifFalse: [ Pila error: 'Pila Buida' ] ] .
	[ :elem | index := index + 1. pila add: elem. ] .
	[ index ] .
	[ index = 0 ] .
	[ pila ]
	 }
]
