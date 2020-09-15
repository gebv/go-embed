test:
	find ./example/* -name '*_genembed.go' -print0 | xargs -0 rm

	go build -v -o ./bin/genembed genembed/genembed.go
	PATH=${PATH}:${PWD}/bin go generate -v -x github.com/gebv/genembed/...

	go test -v -count=1 -race github.com/gebv/genembed/...
	go test -v -count=1 -covermode=count -coverprofile=genembed.cover github.com/gebv/genembed/...

	go vet ./...

lint:
	golangci-lint run ./...
