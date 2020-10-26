"
A HeavenlyStack is .

"
Class {
	#name : #TimeLordsStack,
	#superclass : #Stack,
	#category : #DevilsAndAngels
}

{ #category : #removing }
TimeLordsStack >> pop [
	"Returns the first element and remove it from the stack.
	There will always be an identity function in the bottom of the stack"

	self isEmpty ifTrue: [ ^ [ :x | x ] ].
	^self removeFirst
	
]
