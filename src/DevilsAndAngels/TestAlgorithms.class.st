"
A TestAlgorithms is .

"
Class {
	#name : #TestAlgorithms,
	#superclass : #Object,
	#classInstVars : [
		'aux'
	],
	#category : #DevilsAndAngels
}

{ #category : #Algorithms }
TestAlgorithms class >> TardisExample [
	Tardis initialize.
	(self auxWith: $a and: ( (self auxWith: $b and:  (Tardis fita: 3)) = 4 ) )
		ifTrue: [  	Transcript show: 'aqui!'; cr.
					self auxWith: $c and: (Tardis doctor: 'tot va be') .  ]
		ifFalse: [ 
			(self auxWith: $d and: ( (self auxWith: $e and:  (Tardis fita: 4)) = 5 ) )
				ifTrue: [ self auxWith: $f and: (Tardis doctor: (self auxWith: $g and:  (Tardis angelPloraner: 4))) ]
				ifFalse: [ Transcript show: 'hem arribat fins aqui!'; cr. 
						  self auxWith: $h and: (Tardis angelPloraner: 5).	] ]
]

{ #category : #private }
TestAlgorithms class >> auxWith: anObject and: anotherObject [
	Transcript show: '==> ', anObject asString , ' : ', anotherObject asString; cr.
	^ anotherObject
	
]
