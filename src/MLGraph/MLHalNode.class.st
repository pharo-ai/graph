Class {
	#name : #MLHalNode,
	#superclass : #MLTarjanNode,
	#instVars : [
		'hNumber',
		'previousNodes'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLHalNode >> from: aHalNode [
	previousNodes add: aHalNode
]

{ #category : #accessing }
MLHalNode >> hNumber [
	^ hNumber
]

{ #category : #accessing }
MLHalNode >> hNumber: anObject [
	hNumber := anObject
]

{ #category : #initialization }
MLHalNode >> initialize [
	super initialize.
	previousNodes := Set new
]

{ #category : #testing }
MLHalNode >> isSink [

	^ self nextNodes isEmpty 
]

{ #category : #testing }
MLHalNode >> isSource [

	^ self previousNodes isEmpty 
]

{ #category : #accessing }
MLHalNode >> label [

	^ 'Ha '
]

{ #category : #'hal-algorithm' }
MLHalNode >> markCycleWith: anInteger [

	self cycleNodes do: [ :next | next hNumber: anInteger ].
	^ self cycleNodes 
]

{ #category : #'hal-algorithm' }
MLHalNode >> markHNumber: anInteger [

	self hNumber: anInteger.
	self isInCycle ifTrue: [
		^ self markCycleWith: anInteger
	].
	^ OrderedCollection new
]

{ #category : #accessing }
MLHalNode >> previousNodes [
	^ previousNodes
]

{ #category : #accessing }
MLHalNode >> previousNodes: anObject [
	previousNodes := anObject
]

{ #category : #'hal-algorithm' }
MLHalNode >> removeCycleFromEdges [

	self nextNodes removeAllFoundIn: self cycleNodes.
	self previousNodes removeAllFoundIn: self cycleNodes 
]

{ #category : #accessing }
MLHalNode >> to: aNode [
	super to: aNode.
	aNode previousNodes add: self
]
