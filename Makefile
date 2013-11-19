test:
	go test -timeout=2s ./...

integ: test
	INTEG_TESTS=yes go test -timeout=5s -run=Integ ./...

cov:
	gocov test github.com/hashicorp/raft | gocov-html > /tmp/coverage.html
	open /tmp/coverage.html

.PNONY: test cov integ
