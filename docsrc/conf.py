import os
import sys

# doc theme
html_theme = "sphinx_rtd_theme"

# doc extensions
extensions = [
    "numpydoc",
    "sphinx.ext.viewcode",
    "sphinx.ext.mathjax",
]

# doc parameters
numfig = True

# project details for docs
project = "aws_cdk_demo"
version = "0.0.0"
license = "MIT"

# insert path to source code
sys.path.insert(0, os.path.abspath(".."))
