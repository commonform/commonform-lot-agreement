COMMONFORM=node_modules/.bin/commonform

all: agreement.docx agreement.pdf

$(COMMONFORM):
	npm i --save commonform-cli

agreement.docx: agreement.commonform $(COMMONFORM)
	$(COMMONFORM) render \
		-f docx \
		-n outline \
		-t "LOT Agreement" \
		< $< > $@

agreement.pdf: agreement.docx
	doc2pdf $<
