from setuptools import find_packages, setup

setup(
    name="aoc-python",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "black",
        "isort",
    ],
    entry_points={
        "console_scripts": [
            "2015_001 = 2015_001.main:main",
            "2015_002 = 2015_002.main:main",
        ],
    },
)
