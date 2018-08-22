MAKEFLAGS += --silent
PYTHON := $(shell which python)
PIP := $(shell which pip)


all: install run

clean-pyc:
	echo "*** Cleaning package directories"
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

install:
	$(PIP) install -r requirements.txt
	$(PIP) install -e .

uninstall:
	$(PIP) uninstall .

run:
	$(PYTHON) -m rasa_core.run -d models/dialogue -u models/current/nlu

train:
	$(PYTHON) -m rasa_nlu.train -c nlu_config.yml --data trainingData.md -o models --fixed_model_name nlu --project current --verbose



.PHONY: all clean-pyc clean install-dev install uninstall lint run test
