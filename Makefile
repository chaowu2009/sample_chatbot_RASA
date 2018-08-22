MAKEFLAGS += --silent
PYTHON := $(shell which python)
PIP := $(shell which pip)


clean-pyc:
	echo "--- Cleaning everything ----"
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

install:
	$(PIP) install -r requirements.txt

uninstall:
	$(PIP) uninstall .

train:
	$(PYTHON) -m rasa_nlu.train -c nlu_config.yml --data trainingData.md -o models --fixed_model_name nlu --project current --verbose

run:
	$(PYTHON) -m rasa_core.run -d models/dialogue -u models/current/nlu

