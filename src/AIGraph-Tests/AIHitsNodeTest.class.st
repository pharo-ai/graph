Class {
	#name : #AIHitsNodeTest,
	#superclass : #TestCase,
	#category : #'AIGraph-Tests'
}

{ #category : #tests }
AIHitsNodeTest >> testPrintString [
	|node|
	node := AIHitsNode new
		model: 'model';
		auth: 7;
		hub: 11;
		yourself.
	self assert: node printString equals: '(''model'' 7.00 11.00)'.
]
