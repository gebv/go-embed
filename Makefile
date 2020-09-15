test:
	find ./example/* -name '*_genembed.go' -print0 | xargs -0 rm

	go install -v github.com/gebv/genembed/genembed
	go generate -v -x github.com/gebv/genembed/...

	go test -v -count=1 -race github.com/gebv/genembed/...
	go test -v -count=1 -covermode=count -coverprofile=genembed.cover github.com/gebv/genembed/...

	go vet ./...

lint:
	golangci-lint run ./...