.PHONY: no-carrier
no-carrier:
	sbt 'set test in assembly := {}' clean assembly
	cp no-carrier/target/scala-2.11/no-carrier-assembly-1.0.0.jar no-carrier.jar
