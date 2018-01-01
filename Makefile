.PHONY: dev-dist dev-dist-clean dist
dev-dist:
	python setup.py develop --user

dev-dist-clean:
	python setup.py develop -u --user

dist:
	python setup.py bdist_wheel
	twine upload dist/*
