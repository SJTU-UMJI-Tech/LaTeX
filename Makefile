PWD           = $(shell pwd)
LECTURE_DIR   = ${PWD}/lecture
OUTPUT_DIR    = ${PWD}/build
LATEX         = latexmk
OPTIONS       = -pdfxe -cd --shell-escape -synctex=1 -halt-on-error -deps -time -quiet
CLEAN_OPTIONS = -C -cd

define make_lecture
	${LATEX} ${OPTIONS} ${LECTURE_DIR}/$(1)/$(2).tex > ${LECTURE_DIR}/$(1)/${LATEX}.log
	cp ${LECTURE_DIR}/$(1)/$(2).pdf ${OUTPUT_DIR}/$(2).pdf
endef

define clean_lecture
	${LATEX} ${CLEAN_OPTIONS} -C ${LECTURE_DIR}/$(1)/$(2).tex
endef

separate: c1 c2 c3

c1: init
	$(call make_lecture,c1,c1_get_started)

c2: init
	$(call make_lecture,c2,c2_text)

c3: init
	$(call make_lecture,c3,c3_maths)

all: init
	$(call make_lecture,all,lecture_all)

init:
	[ -d "${OUTPUT_DIR}" ] || mkdir ${OUTPUT_DIR}
	
clean:
	$(call clean_lecture,c1,c1_get_started)
	$(call clean_lecture,c2,c2_text)
	$(call clean_lecture,c3,c3_maths)
