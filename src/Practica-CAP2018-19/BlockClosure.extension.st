Extension { #name : #BlockClosure }

{ #category : #'*Practica-CAP2018-19' }
BlockClosure >> asLabelledBlock: aLabelledBlocksCollection [
	| retblock nxt |
	aLabelledBlocksCollection isEmpty 
		ifTrue: [
			retblock := [ self value. #RETURN binding value: nil ]]
		ifFalse: [ 
			nxt := aLabelledBlocksCollection first.
			retblock := [ self value. (nxt at: 1) binding value ] ].
	^ retblock
		
]
