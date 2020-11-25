"
A basic node able to host the model and to represent edges with no additional class.
Edges are navigable in one way through the nextNodes instance variable.
"
Class {
	#name : #MLNodeWithNext,
	#superclass : #MLGraphNode,
	#instVars : [
		'nextNodes'
	],
	#category : #MLGraph
}

{ #category : #initialization }
MLNodeWithNext >> initialize [
	super initialize.
	nextNodes := OrderedCollection new
]

{ #category : #testing }
MLNodeWithNext >> isLeaf [
	^ self nextNodes isEmpty
]

{ #category : #accessing }
MLNodeWithNext >> nextNodes [
	^ nextNodes
]

{ #category : #setting }
MLNodeWithNext >> nextNodes: aNodeList [
	nextNodes := aNodeList
]

{ #category : #accessing }
MLNodeWithNext >> to: targetNode [
	self nextNodes add: targetNode 
]
