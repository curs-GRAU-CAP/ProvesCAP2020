"
aVarCollection elements are like #(#s v), with s a symbol and v a value, or #s, only a symbol
 aLabelledBlocksCollection elements are like (#label block)
 a block can have expressions like
	 a) #s binding
	 b) #label binding value
	 c) #RETURN binding value: v
	 d) #s changeBinding: v
 No symbol #RETURN is allowed among the labels nor the variable symbols
 No #changeBinding message should be sent to any #label 
"
Class {
	#name : #PROG,
	#superclass : #Object,
	#category : #'Practica-CAP2018-19'
}

{ #category : #private }
PROG class >> buildBlockWith: aVarCollection and: aLabelledBlocksCollection and: start [
	| retblock element tempBlock rest |
	aLabelledBlocksCollection isEmpty
		ifTrue:  [ retblock := [ start binding value ] ]
		ifFalse: [ 
				aVarCollection isNotEmpty 
				ifTrue: [ 
					element := aVarCollection first.
					element isSymbol ifTrue: [ element := Array with: element with: nil ].
					rest := aVarCollection allButFirst.
					tempBlock := self 	buildBlockWith: rest 
											and: aLabelledBlocksCollection 
											and: start. 
					retblock := [ (element at: 1) bindTo: (element at: 2) in: tempBlock ] ]
				ifFalse:[ 
					element := aLabelledBlocksCollection first.
					rest := aLabelledBlocksCollection allButFirst.
					tempBlock := self 	buildBlockWith: aVarCollection
											and: rest 
											and: start.
					retblock := [ (element at: 1) bindTo: ((element at: 2) asLabelledBlock: rest) in: tempBlock ]]].						
	^ retblock 

]

{ #category : #evaluation }
PROG class >> withInit: aVarCollection do: aLabelledBlocksCollection [
	
	 ^ aLabelledBlocksCollection isNotEmpty 
			ifTrue: [ Continuation callcc: [ :ret | 
							| bll |
							bll := (self buildBlockWith: aVarCollection 
											and: aLabelledBlocksCollection
											and: ((aLabelledBlocksCollection first) at: 1)).
							#RETURN bindTo: [ :val | ret value: val ] in: bll ]]
			ifFalse: [ nil ]						
					
]
