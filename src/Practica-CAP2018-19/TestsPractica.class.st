"
Please comment me 
"
Class {
	#name : #TestsPractica,
	#superclass : #TestCase,
	#category : #'Practica-CAP2018-19-tests'
}

{ #category : #tests }
TestsPractica >> testEmpty [
	
	self assert: nil == (PROG withInit: { } do: {	}).
]

{ #category : #tests }
TestsPractica >> testIncrement [
	| out |
	out := 	PROG withInit: { #n } do:
					{	
						{ #label1 . [ #n changeBinding: 0 ] } .
						{ #label2 . [ #n changeBinding: (#n binding + 1) ] } .
						{ #label3 . [ #n changeBinding: (#n binding + 1) ] } .
						{ #label4 . [ #n changeBinding: (#n binding + 1) ] } .
						{ #label5 . [ #n changeBinding: (#n binding + 1) ] } .
						{ #label6 . [ #n changeBinding: (#n binding + 1) ] } .
						{ #label7 . [ #RETURN binding value: #n binding  ] } .
	 				}.
	self assert: out == 5.
]

{ #category : #tests }
TestsPractica >> testIncrementNoReturn [
	| out |
	out := 	PROG withInit: { #n } do:
					{	
						{ #label1 . [ #n changeBinding: 0 ] } .
						{ #label2 . [ #n changeBinding: (#n binding + 1) ] } .
						{ #label3 . [ #n changeBinding: (#n binding + 1) ] } .
						{ #label4 . [ #n changeBinding: (#n binding + 1) ] } .
						{ #label5 . [ #n changeBinding: (#n binding + 1) ] } .
						{ #label6 . [ #n changeBinding: (#n binding + 1) ] } .
	 				}.
	self assert: out equals: nil.
]

{ #category : #tests }
TestsPractica >> testSimple [
	| n coll |
	PROG withInit: { }  do:
		{    { #label1 . [ n := 10. coll := OrderedCollection new ] } .
			{ #label2 . [ n == 0 ifTrue: [ #RETURN binding value: coll ]  ] } .
			{ #label3 . [ coll add: n ] } .
			{ #label4 . [ n := n-1 ] } .
			{ #label5 . [ #label2 binding value ] }
	 	}.
	self assert: coll asArray equals: (10 to: 1 by: -1) asArray
]

{ #category : #tests }
TestsPractica >> testSimpleWithVars [
	| coll |
	coll :=	PROG withInit: { { #n . 10 } . { #coll . OrderedCollection new } }  do:
					{	{ #label2 . [ #n binding == 0 ifTrue: [ #RETURN binding value: #coll binding ]  ] } .
						{ #label3 . [ #coll changeBinding: ((#coll binding) add: #n binding; yourself) ] } .
						{ #label4 . [ #n changeBinding: (#n binding - 1) ] } .
						{ #label5 . [ #label2 binding value ] }
	 				}.
	self assert: coll asArray equals: (10 to: 1 by: -1) asArray
	
]

{ #category : #tests }
TestsPractica >> testSimpleWithVars2 [
	| coll |
	coll :=	PROG withInit: { { #n . 10 } . #s . { #coll . OrderedCollection new } }  do:
					{	{ #label2 . [ #n binding == 0 ifTrue: [ #s changeBinding: #coll binding. 
															   #RETURN binding value: #s binding ]  ] } .
						{ #label3 . [ #coll changeBinding: ((#coll binding) add: #n binding; yourself) ] } .
						{ #label4 . [ #n changeBinding: (#n binding - 1) ] } .
						{ #label5 . [ #label2 binding value ] }
	 				}.
	self assert: coll asArray equals: (10 to: 1 by: -1) asArray
]
