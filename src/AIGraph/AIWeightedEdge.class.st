"
I represent a weighted edge in a graph. 

Public API and Key Messages
- weight
 
Instance Variables
	weight: <Number>
"
Class {
	#name : #AIWeightedEdge,
	#superclass : #AIGraphEdge,
	#instVars : [
		'weight'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AIWeightedEdge >> asTuple [

	^ {from model. to model. weight}
]

{ #category : #printing }
AIWeightedEdge >> printOn: aStream [
	self from printOn: aStream.
	aStream nextPutAll: ' -> '.
	self to printOn: aStream.
	aStream nextPutAll: ' ('.
	self weight printOn: aStream.
	aStream nextPut: $).
]

{ #category : #accessing }
AIWeightedEdge >> weight [
	^ weight
]

{ #category : #accessing }
AIWeightedEdge >> weight: anObject [
	weight := anObject
]
