Class {
	#name : #MLDominanceNode,
	#superclass : #MLDisjointSetNode,
	#instVars : [
		'previousNodes',
		'uniqueSource'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLDominanceNode >> dominantNode [

	^ self find
]

{ #category : #accessing }
MLDominanceNode >> firstSource [

	^ previousNodes first
]

{ #category : #accessing }
MLDominanceNode >> flagUnique [

	uniqueSource := true
]

{ #category : #accessing }
MLDominanceNode >> from: sourceNode [

	previousNodes add: sourceNode 
]

{ #category : #accessing }
MLDominanceNode >> hasUniqueSource [
	^ self previousNodes size = 1
]

{ #category : #initialization }
MLDominanceNode >> initialize [
	super initialize.
	previousNodes := OrderedCollection new.
	uniqueSource := false
]

{ #category : #accessing }
MLDominanceNode >> isDominant [
	"A node is dominant if it has been flagged as the unique Source by one of its target
	 AND it is its own parent in the partition"
	^ uniqueSource and: [self find = self]
]

{ #category : #accessing }
MLDominanceNode >> isDominated [

	^ self isDominant not and: [self find isDominant]
]

{ #category : #accessing }
MLDominanceNode >> label [

	^ 'Dm '
]

{ #category : #accessing }
MLDominanceNode >> previousNodes [
	^ previousNodes
]
