Class {
	#name : #AIHitsNode,
	#superclass : #AINodeWithPreviousAndNext,
	#instVars : [
		'auth',
		'hub'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AIHitsNode >> auth [
	^ auth
]

{ #category : #accessing }
AIHitsNode >> auth: anObject [
	auth := anObject
]

{ #category : #accessing }
AIHitsNode >> hub [
	^ hub
]

{ #category : #accessing }
AIHitsNode >> hub: anObject [
	hub := anObject
]

{ #category : #accessing }
AIHitsNode >> label [

	^ 'H '
]

{ #category : #printing }
AIHitsNode >> printOn: aStream [
	aStream nextPut: $(.
	self model printOn: aStream.
	aStream space.
	self auth printOn: aStream showingDecimalPlaces: 2.
	aStream space.
	self hub printOn: aStream showingDecimalPlaces: 2.
	aStream nextPutAll: ')'.

]
