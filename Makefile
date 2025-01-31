
build:
	@mush build --release

push:
	@git add .
	@git commit -am "Deploy" || true
	@git push

test-build:
	@mush run -- --build github
