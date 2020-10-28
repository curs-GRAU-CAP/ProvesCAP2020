"
After Section 17.6 ""Coroutines: Continuations in Action"" (p.567) of the book ""Scheme and the Art of Programming"", by George Springer and Daniel P. Friedman, MIT Press 1989 (ISBN 0-262-19288-8)
[ http://cs.unm.edu/~williams/cs357/springer-friedman.pdf ]


"
Class {
	#name : #Coroutine,
	#superclass : #Object,
	#instVars : [
		'savedContinuation',
		'firstTime',
		'resumer',
		'theBlock'
	],
	#category : #'Coroutines-CAP2016-17'
}

{ #category : #examples }
Coroutine class >> example1 [
	"Coroutine example1"
	| a b c |
	a := Coroutine maker: [ :resume :value |
				Transcript show: 'This is A'; cr.
				Transcript show: 'Came from ', (resume value: b value: 'A'); cr. 
				Transcript show: 'Back in A'; cr.
				Transcript show: 'Came from ', (resume value: c value: 'A'); cr.  ].
	b := Coroutine maker: [ :resume :value |
				Transcript show: '       This is B'; cr.
				Transcript show: '       Came from ', (resume value: c value: 'B'); cr. 
				Transcript show: '       Back in B'; cr.
				Transcript show: '       Came from ', (resume value: a value: 'B'); cr.  ].
	c := Coroutine maker: [ :resume :value |
				Transcript show: '              This is C'; cr.
				Transcript show: '              Came from ', (resume value: a value: 'C'); cr. 
				Transcript show: '              Back in C'; cr.
				Transcript show: '              Came from ', (resume value: b value: 'C'); cr.  ].
	a value: '*'.

]

{ #category : #'instance creation' }
Coroutine class >> maker: aBlock [
	"Usage: Coroutine maker: [ :resume :value | . . . ] "
	
	^ self new makeCoroutineWith: aBlock
]

{ #category : #'instance creation' }
Coroutine >> initialize [
	super initialize.
	firstTime := true.
	savedContinuation := nil.
	resumer := [ :nextCoroutine :value | 
                   Continuation callcc: [ :cc | savedContinuation := cc.
                                                nextCoroutine value: value  ]  ].

]

{ #category : #'instance creation' }
Coroutine >> makeCoroutineWith: aBlock [ 

	theBlock := aBlock.
]

{ #category : #evaluation }
Coroutine >> value: aValue [

	firstTime ifTrue:  [ firstTime := false.
		                  theBlock value: resumer value: aValue ]
		 	   	 ifFalse: [ savedContinuation value: aValue  ]
			
]
