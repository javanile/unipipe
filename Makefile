
push:
	@git add .
	@git commit -am "Deploy" || true
	@git push
