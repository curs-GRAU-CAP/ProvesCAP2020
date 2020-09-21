"
For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #ProvaClosures,
	#superclass : #Object,
	#category : #ProvesCAP2020
}

{ #category : #'as yet unclassified' }
ProvaClosures class >> provaClosures [
	| comptador resetComptador incComptador valorComptador |
	comptador := 0.
	
	"Creo tres blocs/closures diferents que COMPARTEIXEN la variable local comptador"
	resetComptador := [ comptador := 0. comptador ].
	incComptador := [ :n | comptador := comptador + n. comptador ].
	valorComptador := [ comptador ].
	
	"Retorno els tres blocs dins d'un Array"
	^ { resetComptador . incComptador . valorComptador }	
		
	"Podriem haver retornat
	^ Array with: resetComptador with: incComptador with: valorComptador
	que és el mateix."
]
