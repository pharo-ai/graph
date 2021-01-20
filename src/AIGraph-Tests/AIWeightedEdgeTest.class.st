Class {
	#name : #AIWeightedEdgeTest,
	#superclass : #TestCase,
	#category : #'AIGraph-Tests'
}

{ #category : #tests }
AIWeightedEdgeTest >> testPrintString [
	|edge|
	edge := AIWeightedEdge with: 'model' from: 'from' to: 'to'.
	edge weight: 7.
	self assert: edge printString equals: '''from'' -> ''to'' (7)'.
]
