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
TestAlgorithms class >> auxParenthesis: n and: p and: con [ 
	|  tmpStack |
	tmpStack := con deepCopy.
	n = 0 ifTrue: [ con isEmpty ifTrue: [ 1 to: p - 1 do: [ : i | Transcript show: (aux at: i) asString  ]. 
										Transcript cr.  ]
							ifFalse: [ 	| nn |
										aux at: p put: ')'.
										nn := tmpStack pop.
										self auxParenthesis: nn and: (p + 1)  and: tmpStack.  ]  ]
		ifFalse: [ 	aux at: p put: '('.
					 0 to: n - 1 do: [ : i |
									tmpStack push: (n - i - 1).
									self auxParenthesis: i and: p + 1 and: tmpStack.
									tmpStack pop.  ] ] 
							
]

{ #category : #private }
TestAlgorithms class >> auxWith: anObject and: anotherObject [
	Transcript show: '==> ', anObject asString , ' : ', anotherObject asString; cr.
	^ anotherObject
	
]

{ #category : #Algorithms }
TestAlgorithms class >> parenthesis: n and: p and: con [ 
	aux := Array new: (n * 2).
	self auxParenthesis: n and: p and: con.
	
]
