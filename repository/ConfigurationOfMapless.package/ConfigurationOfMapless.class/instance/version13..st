other
version13: spec
	<version: '1.3' imports: #('1.0-baseline')>
	
	spec
		for: #'gemstone'
		do: [ 

			spec
				blessing: #beta;
				author: 'HeSe';
				repository: 'github://HeSe/Mapless:gemstone-3.1.0.6/src';
				description: 'Mapless is a small framework for storing objects in a key->data fashion (i.e.: noSQL databases) without requiring any kind of object-data map. So far only MongoDB and Redis are supported.'.

			spec package: 'Mapless'.
			 ].
