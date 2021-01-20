Class {
	#name : #AIBfsNode,
	#superclass : #AIGraphNode,
	#traits : 'AITEdgeNode - {#previousEdges. #from:edge:}',
	#classTraits : 'AITEdgeNode classTrait',
	#instVars : [
		'nextEdges',
		'firstDepth'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AIBfsNode >> firstDepth [
	^ firstDepth
]

{ #category : #accessing }
AIBfsNode >> firstDepth: anObject [
	firstDepth := anObject
]

{ #category : #initialization }
AIBfsNode >> initialize [ 

	nextEdges := OrderedCollection new.

]

{ #category : #accessing }
AIBfsNode >> nextEdges [

	^ nextEdges 
]

{ #category : #setting }
AIBfsNode >> notVisited [

	firstDepth := nil
]

{ #category : #testing }
AIBfsNode >> visited [

	^ firstDepth notNil
]
