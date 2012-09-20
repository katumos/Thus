@echo off
cls
cd HandbookEditor
cscript /nologo EditManifest.wsf
cd ..
cd SectionEditor
cscript /nologo EditManifest.wsf
cd ..
cd DocumentEditor
cscript /nologo EditManifest.wsf
cd ..
cd TermDefinitionEditor
cscript /nologo EditManifest.wsf
cd ..
cd BibliographicEditor
cscript /nologo EditManifest.wsf
cd ..
