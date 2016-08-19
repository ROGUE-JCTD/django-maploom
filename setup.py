import os
from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))

setup(
    name='django-maploom',
    version='1.7.0',
    author='Prominent Edge',
    author_email='geoshape.org@gmail.com',
    url='https://github.com/ROGUE-JCTD/django-maploom',
    download_url="https://github.com/ROGUE-JCTD/django-maploom",
    description="Use MapLoom in your django projects.",
    long_description=open(os.path.join(here, 'README.md')).read(),
    license='See LICENSE file.',
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    classifiers=['Topic :: Utilities',
                 'Natural Language :: English',
                 'Operating System :: OS Independent',
                 'Intended Audience :: Developers',
                 'Environment :: Web Environment',
                 'Framework :: Django',
                 'Development Status :: 1 - Planning',
                 'Programming Language :: Python :: 2.7'],
)
