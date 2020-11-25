Class {
	#name : #MLDisjointSetsNextNode,
	#superclass : #MLDisjointSetNode,
	#instVars : [
		'nextNodes'
	],
	#category : #MLGraph
}

{ #category : #initialization }
MLDisjointSetsNextNode >> initialize [
	super initialize.
	self makeSet.
	nextNodes := OrderedCollection new
]

{ #category : #accessing }
MLDisjointSetsNextNode >> nextNodes [

	^ nextNodes 
]

{ #category : #accessing }
MLDisjointSetsNextNode >> to: targetNode [
	self nextNodes add: targetNode
]
