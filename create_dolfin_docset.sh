#!/bin/bash
current_dir=$(pwd)
dolfin_root=$1
cd "${dolfin_root}/python/doc" || exit
make html
rm -rf dolfin.docset
doc2dash build/html -n dolfin -I index.html -i "${current_dir}/icon.png" -u https://fenics-dolfin.readthedocs.io/en/latest/
cp -r dolfin.docset "${current_dir}"
cd "${current_dir}" || exit
tar --exclude='.DS_Store' -cvzf dolfin.tgz dolfin.docset
