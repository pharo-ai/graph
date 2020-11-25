Class {
	#name : #BaselineOfMLGraph,
	#superclass : #BaselineOf,
	#category : #BaselineOfMLGraph
}

{ #category : #baselines }
BaselineOfMLGraph >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec package: 'MLGraph'.

			spec 
				group: 'Core' 						with: #('MLGraph');		
				group: 'Tests' 						with: #('MLGraph' 'MLGraph-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
