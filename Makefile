COMMONFORM=node_modules/.bin/commonform

all: agreement.docx agreement.pdf

$(COMMONFORM):
	npm i --save commonform-cli

agreement.docx: agreement.commonform signatures.json $(COMMONFORM)
	$(COMMONFORM) render \
		--format docx \
		--signatures ./signatures.json \
		--number ase \
		--title "License Effective on Triggering Event (LOT) Agreement" \
		< $< > $@

agreement.pdf: agreement.docx
	doc2pdf $<
