from pathlib import Path
from jinja2 import Environment, FileSystemLoader


def gen_index(root: str):
    root = Path(root)
    notebooks = []
    for notebook in root.rglob("*.html"):
        notebooks.append(str(notebook.relative_to(root)))

    # Configure Jinja2 environment
    templates = 'utils/templates'
    env = Environment(loader=FileSystemLoader(templates))
    template = env.get_template('index.html')

    # Render the template with the HTML file list and save it as 'index.html'
    index_html = template.render(html_files=notebooks)

    index = root / Path("index.html")

    with index.open("w") as f:
        f.write(index_html)

    print('index.html has been generated.')


if __name__ == '__main__':
    gen_index("build")
