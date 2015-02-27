"Load and run tests to be performed by TravisCI"
| gitPath |
Transcript cr; show: 'travis---->travisCI.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.

(Smalltalk at: #GsUpgrader) upgradeGrease. "test against virgin version of GLASS"

GsDeployer deploy: [
  "Load Mapless... "
  Metacello new
    baseline: 'Mapless';
    repository: 'filetree://', gitPath, '/Mapless/src';
    load: #('CI')
].

false ifTrue: [
  "Run all tests in image"
  TravisCISuiteHarness
    value: TestCase suite
    value: 'TravisCISuccess.txt'
    value: 'TravisCIFailure.txt'.
] ifFalse: [
  "Run the  Mapless tests"
  TravisCIHarness
    value: #( 'BaselineOfMapless' )
    value: 'TravisCISuccess.txt' 
    value: 'TravisCIFailure.txt'.
].
