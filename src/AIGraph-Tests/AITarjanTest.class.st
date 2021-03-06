Class {
	#name : #AITarjanTest,
	#superclass : #TestCase,
	#instVars : [
		'tarjan'
	],
	#category : #'AIGraph-Tests'
}

{ #category : #running }
AITarjanTest >> setUp [
	super setUp.
	tarjan := AITarjan new
]

{ #category : #tests }
AITarjanTest >> testComplexCycle [
	| a b c cycleNodesOfC d f e g h |
	AIGraphFixture complexCycleGraph: tarjan.
	tarjan run.
	a := tarjan findNode: $a.
	b := tarjan findNode: $b.
	c := tarjan findNode: $c.
	d := tarjan findNode: $d.
	e := tarjan findNode: $e.
	f := tarjan findNode: $f.
	g := tarjan findNode: $g.
	h := tarjan findNode: $h.
	cycleNodesOfC := Set with: d with: f.
	self deny: a isInCycle.
	self deny: b isInCycle.
	self assert: c isInCycle.
	self assert: d isInCycle.
	self assert: f isInCycle.
	self deny: e isInCycle.
	self assert: g isInCycle.
	self assert: h isInCycle.
	self assert: (c cycleNodes includesAll: cycleNodesOfC).
	self assert: (cycleNodesOfC includesAll: c cycleNodes).
	self assert: (g cycleNodes hasEqualElements: (Array with: h)).
	self assert: (h cycleNodes hasEqualElements: (Array with: g))
]

{ #category : #tests }
AITarjanTest >> testComplexCycle2 [
	| circuits |
	AIGraphFixture complexCycleGraph2: tarjan.
	circuits := tarjan
		run;
		circuits.
	#($a $c $g $h $i) do: [ :each | self deny: (tarjan findNode: each) isInCycle ].
	self assert: circuits size equals: 1.
	self assert: ((circuits first collect: #model) includesAll: #($b $d $e $f))
]

{ #category : #tests }
AITarjanTest >> testCycle [
	| a b c cycleNodesOfA |
	AIGraphFixture cycleGraph: tarjan.
	tarjan run.
	a := tarjan findNode: $a.
	b := tarjan findNode: $b.
	c := tarjan findNode: $c.
	cycleNodesOfA := Set with: b with: c.
	self assert: a isInCycle.
	self assert: b isInCycle.
	self assert: c isInCycle.
	self deny: (tarjan findNode: $d) isInCycle.
	self assert: (a cycleNodes includesAll: cycleNodesOfA).
	self assert: (cycleNodesOfA includesAll: a cycleNodes)
]

{ #category : #tests }
AITarjanTest >> testNestedCycle [
	| a b c cycleNodesOfC d f e g h cycleNodesOfI i |
	AIGraphFixture nestedCycleGraph: tarjan.
	tarjan run.
	a := tarjan findNode: $a.
	b := tarjan findNode: $b.
	c := tarjan findNode: $c.
	d := tarjan findNode: $d.
	e := tarjan findNode: $e.
	f := tarjan findNode: $f.
	g := tarjan findNode: $g.
	h := tarjan findNode: $h.
	i := tarjan findNode: $i.
	cycleNodesOfC := Set
		with: a
		with: b
		with: d
		with: e.
	cycleNodesOfI := Set with: f with: g with: h.
	tarjan nodes do: [ :n | self assert: n isInCycle ].
	self assert: (c cycleNodes includesAll: cycleNodesOfC).
	self assert: (cycleNodesOfC includesAll: c cycleNodes).
	self assert: (i cycleNodes includesAll: cycleNodesOfI).
	self assert: (cycleNodesOfI includesAll: i cycleNodes)
]

{ #category : #tests }
AITarjanTest >> testNoCycle [
	AIGraphFixture simpleGraph: tarjan.
	tarjan run.
	tarjan nodes do: [ :n | self deny: n isInCycle ]
]
