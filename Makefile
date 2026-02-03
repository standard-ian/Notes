.PHONY: put get

put:
	git add .
	git commit
	git push

get:
	git pull
