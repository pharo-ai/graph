Class {
	#name : #AIDisjointSetsNextNode,
	#superclass : #AIDisjointSetNode,
	#instVars : [
		'nextNodes'
	],
	#category : #AIGraph
}

{ #category : #initialization }
AIDisjointSetsNextNode >> initialize [
	super initialize.
	self makeSet.
	nextNodes := OrderedCollection new
]

{ #category : #accessing }
AIDisjointSetsNextNode >> nextNodes [

	^ nextNodes 
]

{ #category : #accessing }
AIDisjointSetsNextNode >> to: targetNode [
	self nextNodes add: targetNode
]
