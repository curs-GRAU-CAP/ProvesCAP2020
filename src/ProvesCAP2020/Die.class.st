"
Responsibilities:
- Yields a random number from 1 to 6 ;-)
"
Class {
	#name : #Die,
	#superclass : #Object,
	#category : #'ProvesCAP2020-SnakesAndLadders'
}

{ #category : #playing }
Die >> roll [
	^ (1 to: 6) atRandom
]
