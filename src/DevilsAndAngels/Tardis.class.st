"
A HeavenHell is .

"
Class {
	#name : #Tardis,
	#superclass : #Object,
	#classInstVars : [
		'past',
		'future'
	],
	#category : #DevilsAndAngels
}

{ #category : #'control-handling' }
Tardis class >> angelPloraner: anObject [ 

	^ Continuation callcc: [ :k | 	
		     self future push: k. 
		     (self past pop) value: anObject  ]. 
]

{ #category : #'control-handling' }
Tardis class >> doctor: anObject [ 

	^ (self future pop) value: anObject 
]

{ #category : #'control-handling' }
Tardis class >> fita: anObject [ 	

	^ Continuation callcc: [ :k | self past push: k.  ^ anObject  ]. 

]

{ #category : #accessing }
Tardis class >> future [
	^ future
]

{ #category : #accessing }
Tardis class >> future: anObject [
	future := anObject.
]

{ #category : #'initialize - release' }
Tardis class >> initialize [
	super initialize.
	self reset.
	
]

{ #category : #accessing }
Tardis class >> past [ 
	^ past
]

{ #category : #accessing }
Tardis class >> past: anObject [
	past := anObject.
]

{ #category : #'initialize - release' }
Tardis class >> reset [
	self past: TimeLordsStack new.
	self future: TimeLordsStack new.
]
