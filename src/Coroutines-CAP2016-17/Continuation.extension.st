Extension { #name : #Continuation }

{ #category : #'*Coroutines-CAP2016-17' }
Continuation class >> callcc: aBlock [
	^ self currentDo: aBlock 
]
