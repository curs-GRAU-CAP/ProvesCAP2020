Extension { #name : #Symbol }

{ #category : #'*Practica-CAP2018-19' }
Symbol >> changeBinding: aValue [
	| context |
	context := thisContext.
	[ context = nil ] whileFalse:
		[   ((context receiver isMemberOf: Binding)
				and: [ context selector = #of:to:in:
					and: [context receiver key = self]])
				ifTrue: [ (context receiver) value: aValue. ^ aValue ]
				ifFalse: [context := context sender]
		].
	self error: 'No binding for ', self asString.
]
