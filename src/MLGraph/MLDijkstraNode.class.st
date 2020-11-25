Class {
	#name : #MLDijkstraNode,
	#superclass : #MLGraphNode,
	#traits : 'MLTEdgeNode',
	#classTraits : 'MLTEdgeNode classTrait',
	#instVars : [
		'pathWeight',
		'previousEdges',
		'nextEdges',
		'previousNodes'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLDijkstraNode >> from: aNode edge: anEdge [

	self previousNodes add: aNode.
	self previousEdges add: anEdge
]

{ #category : #initialization }
MLDijkstraNode >> initialize [

	previousNodes := OrderedCollection new.
	previousEdges := OrderedCollection new.
	nextEdges := OrderedCollection new.
	pathWeight := Float infinity "initialization for Dijsktra"
]

{ #category : #accessing }
MLDijkstraNode >> nextEdges [

	^ nextEdges
]

{ #category : #accessing }
MLDijkstraNode >> pathWeight [
	^ pathWeight
]

{ #category : #accessing }
MLDijkstraNode >> pathWeight: anObject [
	pathWeight := anObject
]

{ #category : #accessing }
MLDijkstraNode >> previousEdges [

	^ previousEdges
]

{ #category : #accessing }
MLDijkstraNode >> previousNodes [

	^ previousNodes
]

{ #category : #printing }
MLDijkstraNode >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' - ';
		nextPutAll: pathWeight asString
]
