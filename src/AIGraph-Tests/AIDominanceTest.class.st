Class {
	#name : #AIDominanceTest,
	#superclass : #TestCase,
	#instVars : [
		'dom'
	],
	#category : #'AIGraph-Tests'
}

{ #category : #running }
AIDominanceTest >> setUp [
	super setUp.
	dom := AIDominance new
]

{ #category : #tests }
AIDominanceTest >> testCycle [
	| a b c |
	AIGraphFixture cycleGraph: dom.
	dom run.
	dom nodes
		do: [ :n | 
			n model = $c
				ifTrue: [
					self assert: n isDominant.
					self deny: n isDominated ]
				ifFalse: [ self deny: n isDominant.
					n model = $d
						ifTrue: [ self deny: n isDominated ]
						ifFalse: [ self assert: n isDominated ] ] ].
	a := dom findNode: $a.
	b := dom findNode: $b.
	c := dom findNode: $c.
	self assert: a find equals: c.
	self assert: b find equals: c
]

{ #category : #tests }
AIDominanceTest >> testSimple [
	| a b c d |
	AIGraphFixture simpleGraph: dom.
	dom run.
	dom nodes
		do: [ :n | 
			n model = $a
				ifTrue: [ 
					self assert: n isDominant.
					self deny: n isDominated ]
				ifFalse: [ self deny: n isDominant ] ].
	a := dom findNode: $a.
	b := dom findNode: $b.
	c := dom findNode: $c.
	d := dom findNode: $d.
	self assert: b find equals: a.
	self deny: c isDominated.
	self deny: d isDominated
]
