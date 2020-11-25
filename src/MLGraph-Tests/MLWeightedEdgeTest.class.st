Class {
	#name : #MLWeightedEdgeTest,
	#superclass : #TestCase,
	#category : #'MLGraph-Tests'
}

{ #category : #tests }
MLWeightedEdgeTest >> testPrintString [
	|edge|
	edge := MLWeightedEdge with: 'model' from: 'from' to: 'to'.
	edge weight: 7.
	self assert: edge printString equals: '''from'' -> ''to'' (7)'.
]
