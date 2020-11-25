Class {
	#name : #MLHitsNodeTest,
	#superclass : #TestCase,
	#category : #'MLGraph-Tests'
}

{ #category : #tests }
MLHitsNodeTest >> testPrintString [
	|node|
	node := MLHitsNode new
		model: 'model';
		auth: 7;
		hub: 11;
		yourself.
	self assert: node printString equals: '(''model'' 7.00 11.00)'.
]
