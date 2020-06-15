# GNU Make Makefile

# the name of your source ascii doctor files
SRC=resume.adoc

# the output files
DOCS=resume.html resume.pdf

# name of your docker image with ascii doctor installed
DCON=centdoc

# the shared directory path between the host and the docker image
# this should match WORKDIR and VOLUME in Dockerfile
DOCDIR=/docs

DIR := ${CURDIR}

all: $(DOCS)

resume.html: $(SRC) *.adoc
	docker run -it -v $(DIR):$(DOCDIR)/:z $(DCON)     asciidoctor $(SRC)

resume.pdf: $(SRC) *.adoc
	docker run -it -v $(DIR):$(DOCDIR)/:z $(DCON) asciidoctor-pdf $(SRC)

image:
	docker build -t $(DCON) .

.PHONY: clean

clean:
	rm -f *.pdf *.html

dockerclean:
	-docker rm $(shell docker ps -aq)
	-docker rmi $(shell docker images -q)
