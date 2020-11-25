Class {
	#name : #MLBfsNode,
	#superclass : #MLGraphNode,
	#traits : 'MLTEdgeNode - {#previousEdges. #from:edge:}',
	#classTraits : 'MLTEdgeNode classTrait',
	#instVars : [
		'nextEdges',
		'firstDepth'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLBfsNode >> firstDepth [
	^ firstDepth
]

{ #category : #accessing }
MLBfsNode >> firstDepth: anObject [
	firstDepth := anObject
]

{ #category : #initialization }
MLBfsNode >> initialize [ 

	nextEdges := OrderedCollection new.

]

{ #category : #accessing }
MLBfsNode >> nextEdges [

	^ nextEdges 
]

{ #category : #setting }
MLBfsNode >> notVisited [

	firstDepth := nil
]

{ #category : #testing }
MLBfsNode >> visited [

	^ firstDepth notNil
]
