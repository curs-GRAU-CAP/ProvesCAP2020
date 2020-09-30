Extension { #name : #String }

{ #category : #'*ProvesCAP2020' }
String >> checkContents [
	| allowed |
	allowed := #($A $T $C $G).
	self do: [ :each | (allowed includes: each) ifFalse: [ ^ false] ].
	^ true
]
