# Makefile for Python project setup and management

PYTHON := python3
VENV := .venv

# Default target
all: install

# Create virtual environment
venv:
	@echo "Creating virtual environment..."
	$(PYTHON) -m venv $(VENV)
	@echo "Virtual environment created in $(VENV)"

# Upgrade pip and essential build tools
upgrade-tools:
	@echo "Upgrading pip, setuptools, and wheel..."
	$(VENV)/bin/python -m pip install --upgrade pip setuptools wheel
	@echo "Installing build tools..."
	$(VENV)/bin/python -m pip install build

# Install project dependencies
install: venv upgrade-tools
	@echo "Installing project dependencies..."
	$(VENV)/bin/python -m pip install -r requirements.txt

# Run tests using pytest
test:
	@echo "Running tests..."
	$(VENV)/bin/python -m pytest -vv --cov=main --cov=mylib test_*.py

# Clean up cache and virtual environment
clean:
	@echo "Cleaning up..."
	rm -rf $(VENV) __pycache__ .pytest_cache

# Check Python and pip versions
check:
	@echo "Python version:"
	$(PYTHON) --version
	@echo "Pip version:"
	$(PYTHON) -m pip --version