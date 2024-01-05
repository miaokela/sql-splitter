from setuptools import setup, find_packages

setup(
    name='sql-spliter',
    version='0.0.2',
    description='Use YAML files to strip SQL statements from the program, and implement dynamic SQL through Jinja2.',
    long_description=open('README.rst').read(),
    author='miaokela',
    author_email='2972799448@qq.com',
    maintainer='miaokela',
    maintainer_email='2972799448@qq.com',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'jinja2',
        'pyyaml',
    ],
    classifiers=[
        'Programming Language :: Python',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: Implementation :: CPython',
        'Programming Language :: Python :: Implementation :: PyPy'
    ],
)
