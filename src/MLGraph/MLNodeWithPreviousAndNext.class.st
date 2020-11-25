"
A basic node able to host the model and to represent edges with no additional class.
Edges are navigable in both way through the nextNodes and prevousNodes instances variables.
"
Class {
	#name : #MLNodeWithPreviousAndNext,
	#superclass : #MLNodeWithNext,
	#instVars : [
		'previousNodes'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLNodeWithPreviousAndNext >> from: sourceNode [
	self previousNodes add: sourceNode 
]

{ #category : #initialization }
MLNodeWithPreviousAndNext >> initialize [
	super initialize.
	previousNodes := OrderedCollection new
]

{ #category : #testing }
MLNodeWithPreviousAndNext >> isRoot [
	^ self previousNodes isEmpty
]

{ #category : #accessing }
MLNodeWithPreviousAndNext >> previousNodes [
	^ previousNodes
]

{ #category : #setting }
MLNodeWithPreviousAndNext >> previousNodes: aNodeList [
	previousNodes := aNodeList
]
