from mylib.calculator import add
from click.testing import CliRunner
from main import add_cli


def test_add():
    assert add(1, 2) == 3


def test_help():
    """Tests the command-line interface help message."""
    runner = CliRunner()
    result = runner.invoke(add_cli, ["--help"])
    assert result.exit_code == 0
    assert "Show this message and exit." in result.output


def test_add_cli():
    """Tests the command-line interface for adding two numbers."""
    runner = CliRunner()
    result = runner.invoke(add_cli, ["1", "2"])
    assert result.exit_code == 0
    assert "3" in result.output
