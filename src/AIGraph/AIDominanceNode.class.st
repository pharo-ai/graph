Class {
	#name : #AIDominanceNode,
	#superclass : #AIDisjointSetNode,
	#instVars : [
		'previousNodes',
		'uniqueSource'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AIDominanceNode >> dominantNode [

	^ self find
]

{ #category : #accessing }
AIDominanceNode >> firstSource [

	^ previousNodes first
]

{ #category : #accessing }
AIDominanceNode >> flagUnique [

	uniqueSource := true
]

{ #category : #accessing }
AIDominanceNode >> from: sourceNode [

	previousNodes add: sourceNode 
]

{ #category : #accessing }
AIDominanceNode >> hasUniqueSource [
	^ self previousNodes size = 1
]

{ #category : #initialization }
AIDominanceNode >> initialize [
	super initialize.
	previousNodes := OrderedCollection new.
	uniqueSource := false
]

{ #category : #accessing }
AIDominanceNode >> isDominant [
	"A node is dominant if it has been flagged as the unique Source by one of its target
	 AND it is its own parent in the partition"
	^ uniqueSource and: [self find = self]
]

{ #category : #accessing }
AIDominanceNode >> isDominated [

	^ self isDominant not and: [self find isDominant]
]

{ #category : #accessing }
AIDominanceNode >> label [

	^ 'Dm '
]

{ #category : #accessing }
AIDominanceNode >> previousNodes [
	^ previousNodes
]
