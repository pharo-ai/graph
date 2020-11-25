Class {
	#name : #MLHitsNode,
	#superclass : #MLNodeWithPreviousAndNext,
	#instVars : [
		'auth',
		'hub'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLHitsNode >> auth [
	^ auth
]

{ #category : #accessing }
MLHitsNode >> auth: anObject [
	auth := anObject
]

{ #category : #accessing }
MLHitsNode >> hub [
	^ hub
]

{ #category : #accessing }
MLHitsNode >> hub: anObject [
	hub := anObject
]

{ #category : #accessing }
MLHitsNode >> label [

	^ 'H '
]

{ #category : #printing }
MLHitsNode >> printOn: aStream [
	aStream nextPut: $(.
	self model printOn: aStream.
	aStream space.
	self auth printOn: aStream showingDecimalPlaces: 2.
	aStream space.
	self hub printOn: aStream showingDecimalPlaces: 2.
	aStream nextPutAll: ')'.

]
