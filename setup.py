from setuptools import setup, find_packages

setup(
    name="mediaplayer",
    version="0.1.0",
    description="A media player manager using Playerctl",
    author="Simon Antonius Lauer",
    author_email="simon.lauer@posteo.de",
    packages=find_packages(),  # Automatically find packages in your source
    install_requires=[
        # "pygobject",  handled by nix
    ],
    entry_points={
        "console_scripts": [
            "mediaplayer = mediaplayer.player:main",
        ],
    },
    python_requires=">=3.6",  # Requires Python 3.6 or later
)
