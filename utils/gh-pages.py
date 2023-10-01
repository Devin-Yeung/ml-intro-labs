from pathlib import Path
import subprocess


def to_html(notebook, output_dir):
    """
    Converts a Jupyter notebook to HTML format and saves it to the specified output directory.

    Args:
        notebook (Path): The path to the Jupyter notebook file.
        output_dir (Path): The path to the directory where the HTML file will be saved.

    Raises:
        CalledProcessError: If the subprocess command fails.

    Returns:
        None
    """
    assert notebook.is_file()
    output_dir.mkdir(parents=True, exist_ok=True)
    command = f"jupyter nbconvert --to html --execute --output-dir \"{output_dir}\" \"{notebook}\""
    print(command)
    try:
        result = subprocess.run(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True,
                                check=True)
    except subprocess.CalledProcessError as e:
        # Handle any errors that occurred during command execution
        print(f"Command failed with error: {e}")
        print(e.stderr)


if __name__ == '__main__':
    root = Path('./')

    for notebook in root.rglob('*.ipynb'):
        output_dir = Path('build') / notebook.relative_to(root).parent
        to_html(notebook, output_dir)
