Class {
	#name : #MLCseEdge,
	#superclass : #MLDijkstraEdge,
	#instVars : [
		'cseVisited'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLCseEdge >> cseVisited [
	^ cseVisited
]

{ #category : #accessing }
MLCseEdge >> cseVisited: aBoolean [
	cseVisited := aBoolean
]

{ #category : #initialization }
MLCseEdge >> initialize [ 

	super initialize.
	self cseVisited: false.
]
