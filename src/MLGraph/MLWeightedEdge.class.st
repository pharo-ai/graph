"
I represent a weighted edge in a graph. 

Public API and Key Messages
- weight
 
Instance Variables
	weight: <Number>
"
Class {
	#name : #MLWeightedEdge,
	#superclass : #MLGraphEdge,
	#instVars : [
		'weight'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLWeightedEdge >> asTuple [

	^ {from model. to model. weight}
]

{ #category : #printing }
MLWeightedEdge >> printOn: aStream [
	self from printOn: aStream.
	aStream nextPutAll: ' -> '.
	self to printOn: aStream.
	aStream nextPutAll: ' ('.
	self weight printOn: aStream.
	aStream nextPut: $).
]

{ #category : #accessing }
MLWeightedEdge >> weight [
	^ weight
]

{ #category : #accessing }
MLWeightedEdge >> weight: anObject [
	weight := anObject
]
